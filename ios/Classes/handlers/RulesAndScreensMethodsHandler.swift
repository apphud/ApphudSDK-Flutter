//
//  RulesAndScreensMethodsHandler.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import Foundation
import ApphudSDK

class RulesAndScreensMethodsHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.RulesAndScreensMethods

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.showPendingScreen.rawValue:
            Task { @MainActor in
                let hasPending = Apphud.pendingRuleScreenController() != nil
                if hasPending {
                    Apphud.showPendingRuleScreen()
                }
                result(hasPending)
            }
        case AssociatedEnum.pendingScreenController.rawValue:
            // UIViewController is not usable from Flutter.
            result(nil)
        case AssociatedEnum.pendingRule.rawValue:
            Task { @MainActor in
                result(Apphud.pendingRule()?.toMap())
            }
        case AssociatedEnum.checkRules.rawValue:
            ApphudUtils.checkRules()
            result(nil)
        case AssociatedEnum.submitPushNotificationsToken.rawValue:
            guard let token = args?["token"] as? String, !token.isEmpty else {
                result(FlutterError(
                    code: "400",
                    message: "token is required",
                    details: nil
                ))
                return
            }
            Apphud.submitPushNotificationsTokenString(string: token) { success in
                result(success)
            }
        case AssociatedEnum.handlePushNotification.rawValue:
#if os(iOS)
            guard let args = args else {
                result(false)
                return
            }
            let handled = Apphud.handlePushNotification(apsInfo: args)
            result(handled)
#else
            result(false)
#endif
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
