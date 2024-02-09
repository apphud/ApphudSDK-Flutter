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
            
            var paywall:ApphudPaywall?
            
            if(placementIdentifier != nil) {
                let placements = await Apphud.placements()
                paywall = placements.first(where: {pl in pl.identifier == placementIdentifier})?.paywall
            } else {
            let paywalls = await Apphud.paywalls()
            paywall = paywalls.first(where: { pw in return pw.identifier == paywallIdentifier })
            }
            if(paywall != nil) {
                Apphud.paywallShown(paywall!)
            }
            result(nil)
        }
    }
}
