//
//  ApphudPaywallsHelper.swift
//  apphud
//
//  Created by Nikolay Ivanov on 18.10.2024.
//

import ApphudSDK
import Combine

final class ApphudPaywallsHelper {
    static func getPaywall(paywallIdentifier:String, placementIdentifier: String?) async -> ApphudPaywall? {
        var paywall:ApphudPaywall?
        
        if(placementIdentifier != nil) {
            let placements = await Apphud.placements()
            paywall = placements.first(where: {pl in pl.identifier == placementIdentifier})?.paywall
        } else {
            let paywalls = await Apphud.placements().compactMap(\.paywall)
            paywall = paywalls.first(where: { pw in return pw.identifier == paywallIdentifier })
        }
        return paywall
    }
    
    static func getPaywalls() async -> [ApphudPaywall] {
        let paywalls = await Apphud.placements().compactMap(\.paywall)
        return paywalls
    }
}
