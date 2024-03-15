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
                "parentPaywallIdentifier" : parentPaywallIdentifier
        ]
    }
}

extension ApphudProduct {
    func toMap() -> [String: Any?] {
        return ["productId" : productId,
                "name" : name,
                "store" :store,
                "paywallIdentifier" : paywallIdentifier,
                "placementIdentifier" : placementIdentifier,
                "skProduct" : skProduct?.toMap()
        ]
    }
}

