//
//  PaywallsDidLoadCallback.swift
//  apphud
//
//  Created by Nikolay on 07.10.2021.
//

//

import ApphudSDK
import StoreKit

final class PaywallsDidLoadCallbackRequest: Request {

    typealias ArgumentProvider = PaywallsDidLoadCallbackArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.paywallsDidLoadCallback{ (paywalls: [ApphudPaywall]) in
            result([
                "paywalls" : paywalls.map({ (paywall: ApphudPaywall) in paywall.toMap() }),
            ])
        }
    }
}

final class PaywallsDidLoadCallbackArgumentParser: Parser {
    typealias ArgumentType = ()
}
