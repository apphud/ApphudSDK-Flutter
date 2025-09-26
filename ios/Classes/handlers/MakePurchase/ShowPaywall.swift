//
//  ShowPaywall.swift
//  apphud
//
//  Created by Renat Kurbanov on 24.09.2025.
//

import ApphudSDK
import Foundation
import UIKit
import ObjectiveC

final class ShowPaywallRequest: @preconcurrency Request {
    typealias ArgumentProvider = ShowPaywallArgumentParser

    internal func apphudVisibleViewController() -> UIViewController? {

        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first

        var currentVC = keyWindow?.rootViewController
        while let presentedVC = currentVC?.presentedViewController {
            currentVC = presentedVC
        }
        return currentVC
    }
    
    @MainActor
    private func presentController(_ controller: UIViewController, with animationStyle: IOSAnimationStyle) {
        guard let presentingVC = apphudVisibleViewController() else { return }
        
        switch animationStyle {
        case .none:
            presentingVC.present(controller, animated: false)
            
        case .bottomToTop:
            presentingVC.present(controller, animated: true)
            
        case .rightToLeft:
            // Custom right-to-left animation that simulates push style
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            
            // Create a custom transition delegate
            let transitionDelegate = RightToLeftTransitionDelegate()
            controller.transitioningDelegate = transitionDelegate
            
            // Store the delegate to prevent deallocation
            objc_setAssociatedObject(controller, &AssociatedKeys.transitionDelegate, transitionDelegate, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            presentingVC.present(controller, animated: true)
        }
    }

    @MainActor
    func startRequest(
        arguments: (
            paywallIdentifier: String?, placementIdentifier: String?, maxTimeout: Double,
            isPreload: Bool, iOSAnimationStyle: IOSAnimationStyle
        ), result: @escaping FlutterResult
    ) {

        Apphud.fetchPlacements { placements, _ in
            let paywalls = placements.compactMap(\.paywall)
            let paywall = arguments.isPreload ? placements.first(where: { $0.identifier == arguments.placementIdentifier })?.paywall : paywalls.first(where: { $0.identifier == arguments.paywallIdentifier })

            if let paywall {
                Apphud.fetchPaywallScreen(paywall, maxTimeout: arguments.maxTimeout) {
                    screenResult in
                    switch screenResult {
                    case .success(let controller):
                        if arguments.isPreload {
                            result([
                                "success": true,
                                "error": nil,
                            ])
                            return
                        }

                        self.presentController(controller, with: arguments.iOSAnimationStyle)
                        controller.onTransactionCompleted = { purchaseResult in
                            if purchaseResult.success {
                                result([
                                    "success": true,
                                    "userClosed": false,
                                    "purchaseResult": purchaseResult.toMap(),
                                ])
                            } else {
                                // do not handle unsuccessful transaction results, since paywall remains visible
                            }
                        }
                        controller.onCloseButtonTapped = {
                            result([
                                "success": false,
                                "userClosed": true,
                            ])
                        }
                    case .error(let error):
                        result([
                            "success": false,
                            "userClosed": false,
                            "error": ["message": error.localizedDescription],
                        ])
                    }
                }
            } else {
                result([
                    "success": false,
                    "userClosed": false,
                    "error": ["message": "Paywall with given identifier not found"],
                ])
            }

        }
    }
}

enum IOSAnimationStyle: String, CaseIterable {
    case none = "none"
    case bottomToTop = "bottomToTop"
    case rightToLeft = "rightToLeft"
}

final class ShowPaywallArgumentParser: Parser {
    typealias ArgumentType = (paywallIdentifier: String?, placementIdentifier: String?, maxTimeout: Double, isPreload: Bool, iOSAnimationStyle: IOSAnimationStyle)

    func parse(args: [String: Any]?) throws -> ArgumentType {

        guard let args = args else {
            throw (InternalError(code: "400", message: "arguments are required"))
        }

        let paywallIdentifier = args["paywallIdentifier"] as? String
        let placementIdentifier = args["placementIdentifier"] as? String
        let isPreload = args["isPreload"] as? Bool ?? false
        let animationStyleString = args["iOSAnimationStyle"] as? String
        let iOSAnimationStyle = IOSAnimationStyle(rawValue: animationStyleString ?? "") ?? .bottomToTop

        if isPreload && placementIdentifier == nil {
            throw
                (InternalError(code: "400", message: "placementIdentifier is required for preload"))
        }

        if !isPreload && paywallIdentifier == nil {
            throw (InternalError(code: "400", message: "paywallIdentifier is required for show"))
        }

        let maxTimeout = args["maxTimeout"] as? Double ?? 7.0

        return (paywallIdentifier: paywallIdentifier, placementIdentifier: placementIdentifier, maxTimeout: maxTimeout, isPreload: isPreload, iOSAnimationStyle: iOSAnimationStyle)
    }
}

// MARK: - Custom Transition Animation

private struct AssociatedKeys {
    static var transitionDelegate = "transitionDelegate"
}

class RightToLeftTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return RightToLeftPresentationAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return RightToLeftDismissalAnimator()
    }
}

class RightToLeftPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        
        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        
        // Start from the right edge
        toViewController.view.frame = CGRect(
            x: containerView.bounds.width,
            y: finalFrame.origin.y,
            width: finalFrame.width,
            height: finalFrame.height
        )
        
        containerView.addSubview(toViewController.view)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                toViewController.view.frame = finalFrame
            },
            completion: { finished in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        )
    }
}

class RightToLeftDismissalAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }
        
        let containerView = transitionContext.containerView
        let initialFrame = fromViewController.view.frame
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                fromViewController.view.frame = CGRect(
                    x: containerView.bounds.width,
                    y: initialFrame.origin.y,
                    width: initialFrame.width,
                    height: initialFrame.height
                )
            },
            completion: { finished in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        )
    }
}
