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
                "name": name,
                "default": isDefault,
                "json": json,
                "products" : products.map({ (product:ApphudProduct) in product.toMap() })
        ]
    }
}

extension ApphudProduct {
    func toMap() -> [String: Any?] {
        return ["productId" : productId,
                "name" : name,
                "store" :store,
                "paywallId" : paywallId,
                "skProduct" : skProduct?.toMap()
        ]
    }
}

