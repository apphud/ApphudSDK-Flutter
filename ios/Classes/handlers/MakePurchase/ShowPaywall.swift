//
//  ShowPaywall.swift
//  apphud
//
//  Created by Renat Kurbanov on 24.09.2025.
//

import Foundation
import ApphudSDK

final class ShowPaywallRequest: @preconcurrency Request {
    typealias ArgumentProvider = ShowPaywallArgumentParser

    internal func apphudVisibleViewController() -> UIViewController? {

        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        var currentVC = keyWindow?.rootViewController
        while let presentedVC = currentVC?.presentedViewController {
            currentVC = presentedVC
        }
        return currentVC
    }
    
    @MainActor
    func startRequest(arguments: (paywallIdentifier: String, maxTimeout: Double), result: @escaping FlutterResult) {
        
        Apphud.fetchPlacements { placements, _ in
            let paywalls = placements.compactMap(\.paywall)
            if let paywall = paywalls.first(where: { $0.identifier == arguments.paywallIdentifier }) {
                Apphud.fetchPaywallScreen(paywall, maxTimeout: arguments.maxTimeout) { screenResult in
                    switch screenResult {
                    case .success(let controller):
                        self.apphudVisibleViewController()?.present(controller, animated: true)
                        controller.onFinished = { paywallResult in
                                    switch paywallResult {
                                    case .success(let purchase):
                                        // User made a purchase or restored, allow to dismiss
                                        result([
                                            "success": true,
                                            "error": nil,
                                            "purchaseResult": purchase.toMap()
                                        ])
                                        return .allow
                                    case .failure(let error):
                                        // User canceled a payment or an error occurred. do not dismiss
                                        result([
                                            "success": false,
                                            "error": ["message": error.localizedDescription]
                                        ])
                                        return .cancel
                                    case .userClosed:
                                        // User closed a paywall, allow to dismiss
                                        result([
                                            "success": false,
                                            "userClosed": true
                                        ])
                                        return .allow
                                    }
                                }
                    case .error(let error):
                        result([
                            "success": false,
                            "error": ["message": error.localizedDescription]
                        ])
                    }
                }
            } else {
                result([
                    "success": false,
                    "error": ["message": "Paywall with given identifier not found"]
                ])
            }
            
        }
    }
}

final class ShowPaywallArgumentParser: Parser {
    typealias ArgumentType = (paywallIdentifier: String, maxTimeout: Double)
    
    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let paywallIdentifier = args["paywallIdentifier"] as? String else {
            throw(InternalError(code: "400", message: "paywallIdentifier is required argument"))
        }
        let maxTimeout = args["maxTimeout"] as? Double ?? 7.0
        
        return (paywallIdentifier: paywallIdentifier, maxTimeout: maxTimeout)
    }
}

