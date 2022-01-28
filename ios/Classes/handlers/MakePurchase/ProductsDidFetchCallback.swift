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
        Apphud.productsDidFetchCallback { (products,error) in
            if(error == nil){
                result(products.map{ product in product.toMap()})
            } else {
                result(FlutterError(code: "500", message: error?.localizedDescription, details: nil))
            }
        }
    }
}

final class ProductsDidFetchCallbackArgumentParser: Parser {
    typealias ArgumentType = ()
}
