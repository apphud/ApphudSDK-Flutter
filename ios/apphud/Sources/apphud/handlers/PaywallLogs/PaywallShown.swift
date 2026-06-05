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
        Task{@MainActor in
            let paywallIdentifier = arguments.paywallIdentifier
            let placementIdentifier = arguments.placementIdentifier
            
            let paywall = await ApphudPaywallsHelper.getPaywall(paywallIdentifier:paywallIdentifier,
                                                          placementIdentifier:placementIdentifier)
            
            if(paywall != nil) {
                Apphud.paywallShown(paywall!)
            }
            result(nil)
        }
    }
}
