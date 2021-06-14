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
        Apphud.getPaywalls { (paywalls: [ApphudPaywall]?,error: Error?) in
            result([
                "paywalls" : paywalls?.map({ (paywall: ApphudPaywall) in paywall.toMap() }),
                "error": error == nil ? nil : ["message": error?.localizedDescription]
            ])
        }
    }
}

final class GetPaywallsArgumentParser: Parser {
    typealias ArgumentType = ()
}
