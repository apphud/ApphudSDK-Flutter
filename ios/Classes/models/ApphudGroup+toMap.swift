//
//  ApphudGroup+toMap.swift
//  apphud
//
//  Created by Nikolay on 11.06.2021.
//

import ApphudSDK

extension ApphudGroup {
    func toMap() -> [String: Any?] {
        return [
                "name": name,
                "hasAccess": hasAccess,
                "products" : products.map({ (product:ApphudProduct) in product.toMap() })
               ]
    }
}
