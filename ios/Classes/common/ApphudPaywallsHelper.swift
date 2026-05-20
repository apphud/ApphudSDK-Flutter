//
//  ApphudPaywallsHelper.swift
//  apphud
//
//  Created by Nikolay Ivanov on 18.10.2024.
//

import ApphudSDK

final class ApphudPaywallsHelper {
    static func getPaywalls() async -> [ApphudPaywall] {
        await Apphud.placements().compactMap(\.paywall)
    }

    static func getPaywall(paywallIdentifier: String, placementIdentifier: String?) async -> ApphudPaywall? {
        if let placementIdentifier {
            return await Apphud.placement(placementIdentifier)?.paywall
        }
        return await getPaywalls().first(where: { $0.identifier == paywallIdentifier })
    }

    static func resolveProduct(
        productId: String,
        paywallIdentifier: String?,
        placementIdentifier: String?
    ) async -> ApphudProduct? {
        guard placementIdentifier != nil || paywallIdentifier != nil else {
            return nil
        }
        let paywall = await getPaywall(
            paywallIdentifier: paywallIdentifier ?? "",
            placementIdentifier: placementIdentifier
        )
        return paywall?.products.first(where: { $0.productId == productId })
    }
}
