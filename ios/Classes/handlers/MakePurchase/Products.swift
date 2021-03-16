//
//  Products.swift
//  appHud
//
//  Created by Stanislav on 08.02.2021.
//

import ApphudSDK
import StoreKit

final class ProductsRequest: Request {

    typealias ArgumentProvider = ProductsArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        if let products = Apphud.products() {
            result(products.map{ product in product.toMap()})
            return
        }
        Apphud.productsDidFetchCallback { products in
            result(products.map{ product in product.toMap()})
            return
        }
    }
}

final class ProductsArgumentParser: Parser {
    typealias ArgumentType = ()
}
