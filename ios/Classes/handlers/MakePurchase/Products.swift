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
        if let products = Apphud.products {
            result(products.map{ product in product.toMap()})
            return
        }
        Apphud.productsDidFetchCallback { (products,error) in
            if(error == nil){
                result(products.map{ product in product.toMap()})
            } else {
                result(FlutterError(code: "500", message: error?.localizedDescription, details: nil))
            }
        }
    }
}

final class ProductsArgumentParser: Parser {
    typealias ArgumentType = ()
}
