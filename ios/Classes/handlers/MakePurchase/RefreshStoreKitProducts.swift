//
//  RefreshStoreKitProducts.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import Foundation
import ApphudSDK

final class RefreshStoreKitProductsRequest: Request {
    typealias ArgumentProvider = RefreshStoreKitProductsArgumentParser
    
    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.refreshStoreKitProducts { products in
            result(products.map{ product in product.toMap()})
        }
    }

}

final class  RefreshStoreKitProductsArgumentParser: Parser {
    typealias ArgumentType = ()
}
