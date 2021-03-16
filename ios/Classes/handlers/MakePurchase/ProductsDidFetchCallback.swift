//
//  ProductsDidFetchCallback.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import Foundation
import ApphudSDK

final class ProductsDidFetchCallbackRequest: Request {

    typealias ArgumentProvider = ProductsDidFetchCallbackArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.productsDidFetchCallback { products in
            result(products.map{ product in product.toMap()})
        }
    }
}

final class ProductsDidFetchCallbackArgumentParser: Parser {
    typealias ArgumentType = ()
}
