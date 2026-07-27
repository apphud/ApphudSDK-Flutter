//
//  ApphudUIDelegateHandler.swift
//  apphud
//

import Foundation
import ApphudSDK
import StoreKit
#if canImport(UIKit)
import UIKit
#endif

/// Forwards Apphud Rules UI lifecycle events to Dart.
/// Gates always auto-allow (events-only bridge).
///
/// Does not conform to `ApphudUIDelegate` itself — that protocol is `@MainActor`,
/// and conforming would MainActor-isolate this FlutterPlugin type (breaking
/// construction during `register`). The real delegate is `ApphudUIDelegateProxy`,
/// created on the main actor in `startListening`.
public class ApphudUIDelegateHandler: NSObject, FlutterPlugin {
    fileprivate var isListeningStarted: Bool = false
    fileprivate var channel: FlutterMethodChannel
    /// Retains the MainActor UI delegate (type-erased for isolation boundaries).
    private var uiDelegateProxy: NSObject?

    internal init(channel: FlutterMethodChannel) {
        self.channel = channel
    }

    public static func register(with registrar: FlutterPluginRegistrar) {}

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "startListening":
            start()
            result(nil)
        case "stopListening":
            stop()
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func start() {
        isListeningStarted = true
        Task { @MainActor in
            let proxy = ApphudUIDelegateProxy(handler: self)
            self.uiDelegateProxy = proxy
            Apphud.setUIDelegate(proxy)
        }
    }

    private func stop() {
        // `Apphud.setUIDelegate` is non-optional; gate events and drop our retain.
        isListeningStarted = false
        uiDelegateProxy = nil
    }

    fileprivate func invoke(_ method: String, arguments: [String: Any?]?) {
        guard isListeningStarted else { return }
        channel.invokeMethod(method, arguments: arguments)
    }
}

@MainActor
final class ApphudUIDelegateProxy: NSObject, ApphudUIDelegate {
    private weak var handler: ApphudUIDelegateHandler?

    init(handler: ApphudUIDelegateHandler) {
        self.handler = handler
    }

    private func currentRuleMap(screenName: String?) -> [String: Any?] {
        if let rule = Apphud.pendingRule() {
            return rule.toMap()
        }
        return [
            "ruleName": "",
            "screenName": screenName ?? "",
            "screenId": nil as String?,
            "paywallId": nil as String?,
            "paywallIdentifier": nil as String?,
        ]
    }

    private func invoke(_ method: String, arguments: [String: Any?]?) {
        handler?.invoke(method, arguments: arguments)
    }

    // MARK: - Gates (always allow)

    func apphudShouldPerformRule(rule: ApphudRule) -> Bool {
        return true
    }

    func apphudShouldShowScreen(screenName: String) -> Bool {
        return true
    }

#if os(iOS)
    func apphudScreenDismissAction(
        screenName: String,
        controller: UIViewController
    ) -> ApphudScreenDismissAction {
        return .thankAndClose
    }
#endif

#if os(iOS)
    func apphudRuleWithoutPaywallScreen(rule: ApphudRule, paywall: ApphudPaywall) {
        invoke("apphudRulePaywallWithoutScreen", arguments: [
            "rule": rule.toMap(),
            "paywall": paywall.toMap(),
        ])
    }
#endif

    // MARK: - Lifecycle events

    func apphudScreenDidAppear(screenName: String) {
        invoke("apphudRuleScreenDidAppear", arguments: [
            "rule": currentRuleMap(screenName: screenName),
        ])
    }

    func apphudWillPurchase(product: SKProduct, offerID: String?, screenName: String) {
        let productMap: [String: Any?] = [
            "productId": product.productIdentifier,
            "store": "app_store",
            "name": product.localizedTitle,
            "skProduct": product.toMap(),
        ]
        invoke("apphudRuleWillPurchase", arguments: [
            "rule": currentRuleMap(screenName: screenName),
            "product": productMap,
        ])
    }

    func apphudDidPurchase(product: SKProduct, offerID: String?, screenName: String) {
        invoke("apphudRulePurchaseCompleted", arguments: [
            "rule": currentRuleMap(screenName: screenName),
            "result": [
                "error": nil as Any?,
                "isRestore": false,
            ] as [String: Any?],
        ])
    }

    func apphudDidFailPurchase(
        product: SKProduct,
        offerID: String?,
        errorCode: SKError.Code,
        screenName: String
    ) {
        invoke("apphudRulePurchaseCompleted", arguments: [
            "rule": currentRuleMap(screenName: screenName),
            "result": [
                "error": [
                    "message": "Purchase failed",
                    "errorCode": errorCode.rawValue,
                    "networkIssue": false,
                ] as [String: Any?],
                "isRestore": false,
            ] as [String: Any?],
        ])
    }

    func apphudScreenWillDismiss(screenName: String, error: Error?) {
        invoke("apphudRuleScreenWillDismiss", arguments: [
            "rule": currentRuleMap(screenName: screenName),
            "error": error?.localizedDescription,
        ])
    }

#if os(iOS)
    func apphudDidDismissScreen(controller: UIViewController, screenName: String?) {
        invoke("apphudRuleScreenDidDismiss", arguments: [
            "rule": currentRuleMap(screenName: screenName),
        ])
    }

    func apphudDidDismissScreen(controller: UIViewController) {
        invoke("apphudRuleScreenDidDismiss", arguments: [
            "rule": currentRuleMap(screenName: nil),
        ])
    }
#endif

    func apphudDidSelectSurveyAnswer(question: String, answer: String, screenName: String) {
        invoke("apphudRuleDidSelectSurveyAnswer", arguments: [
            "rule": currentRuleMap(screenName: screenName),
            "question": question,
            "answer": answer,
        ])
    }
}
