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
        Apphud.refreshStoreKitProducts { (products,error) in
                if(error == nil){
                    result(products.map{ product in product.toMap()})
                } else {
                    result(FlutterError(code: "500", message: error?.localizedDescription, details: nil))
                }
        }
    }
}

final class  RefreshStoreKitProductsArgumentParser: Parser {
    typealias ArgumentType = ()
}
