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

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.paywallsDidLoadCallback{ paywalls, error in
            result([
                "paywalls" : paywalls.map({ (paywall: ApphudPaywall) in paywall.toMap() }),
            ])
        }
    }
}

final class PaywallsDidLoadCallbackArgumentParser: Parser {
    typealias ArgumentType = ()
}
