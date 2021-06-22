//
//  PaywallLogsHandler.swift
//  apphud
//
//  Created by Nikolay on 11.06.2021.
//

import Foundation

class PaywallLogsHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.PaywallLogs

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.paywallShown.rawValue:
            Action<PaywallShownRequest,PaywallArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.paywallClosed.rawValue:
            Action<PaywallClosedRequest,PaywallArgumentParser>(args: args, result: result).startFlow()
        default:
            break
        }
    }
}
