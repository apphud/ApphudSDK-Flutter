//
//  GetPaywalls.swift
//  apphud
//
//  Created by Nikolay on 09.06.2021.
//

import ApphudSDK
import StoreKit

final class GetPaywallsRequest: Request {

    typealias ArgumentProvider = GetPaywallsArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Task{ @MainActor in
            let paywalls = await Apphud.paywalls()
            result([
                "paywalls" : paywalls.map({ (paywall: ApphudPaywall) in paywall.toMap() }),
            ])
        }
    }
}

final class GetPaywallsArgumentParser: Parser {
    typealias ArgumentType = ()
}
