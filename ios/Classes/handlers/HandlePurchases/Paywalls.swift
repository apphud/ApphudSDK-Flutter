//
//  Paywalls.swift
//  apphud
//
//  Created by Nikolay on 07.10.2021.
//

import ApphudSDK
import StoreKit

final class PaywallsRequest: Request {

    typealias ArgumentProvider = PaywallsArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Task{@MainActor in
            let paywalls = await Apphud.paywalls()
            let paywallsMap = paywalls.map({ (paywall: ApphudPaywall) in paywall.toMap() })
            result(["paywalls" : paywallsMap])
        }
    }
}

final class PaywallsArgumentParser: Parser {
    typealias ArgumentType = ()
}
