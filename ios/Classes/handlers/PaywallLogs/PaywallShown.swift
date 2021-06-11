//
//  PaywallShown.swift
//  apphud
//
//  Created by Nikolay on 11.06.2021.
//

import ApphudSDK
import StoreKit

final class PaywallShownRequest: Request {
    typealias ArgumentProvider = PaywallArgumentParser

    func startRequest(arguments: PaywallArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Apphud.getPaywalls { (paywalls:[ApphudPaywall]?, _ ) in
            let paywall = paywalls?.first { pw in return pw.identifier==arguments }
            Apphud.paywallShown(paywall)
        }
        result(nil)
    }
}
