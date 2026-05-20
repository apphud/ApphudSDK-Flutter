//
//  ApphudPaywall+toMap.swift
//  apphud
//
//  Created by Nikolay on 09.06.2021.
//

import ApphudSDK

extension ApphudPaywall {
    func toMap() -> [String: Any?] {
        return ["identifier": identifier,
                "json": json,
                "products" : products.map({ (product:ApphudProduct) in product.toMap() }),
                "experimentName" : experimentName,
                "placementIdentifier" : placementIdentifier,
                "variationName" : variationName,
                "parentPaywallIdentifier" : parentPaywallIdentifier,
                "hasScreen": screen != nil
        ]
    }
}

extension ApphudProduct {
    func toMap() -> [String: Any?] {
        var map: [String: Any?] = [
            "productId": productId,
            "name": name,
            "store": store,
            "paywallIdentifier": paywallIdentifier,
            "placementIdentifier": placementIdentifier,
            "skProduct": skProduct?.toMap(),
            "variationIdentifier": variationIdentifier,
            "experimentId": experimentId,
        ]
        if let properties,
           let encoded = try? JSONEncoder().encode(properties),
           let json = try? JSONSerialization.jsonObject(with: encoded),
           let flutterProperties = json as? [String: Any] {
            map["properties"] = flutterProperties
        }
        return map
    }
}

