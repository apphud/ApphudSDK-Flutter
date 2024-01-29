//
//  PaywallClosed.swift
//  apphud
//
//  Created by Nikolay on 11.06.2021.
//

import ApphudSDK
import StoreKit

final class PaywallClosedRequest: Request {
    typealias ArgumentProvider = PaywallArgumentParser

    func startRequest(arguments: PaywallArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Task{@MainActor in
            let paywalls = await Apphud.paywalls()
            
            if let paywall = paywalls.first(where: { pw in return pw.identifier==arguments }) {
                Apphud.paywallClosed(paywall)
            }
            result(nil)
        }
    }
}

