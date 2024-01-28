//
//  Paywalls.swift
//  apphud
//
//  Created by Nikolay on 07.10.2021.
//

import ApphudSDK
import StoreKit

final class RawPaywallsRequest: Request {

    typealias ArgumentProvider = RawPaywallsArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        let paywalls = Apphud.rawPaywalls()
        let paywallsMap = paywalls.map({ (paywall: ApphudPaywall) in paywall.toMap() })
        result(["paywalls" : paywallsMap])
    }
}

final class RawPaywallsArgumentParser: Parser {
    typealias ArgumentType = ()
}
