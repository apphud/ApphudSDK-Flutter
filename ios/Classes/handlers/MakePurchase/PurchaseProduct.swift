//
//  PurchaseProduct.swift
//  apphud
//
//  Created by Nikolay on 10.06.2021.
//

import ApphudSDK
import StoreKit

final class PurchaseProductRequest: Request {
    typealias ArgumentProvider = PurchaseProductArgumentParser
    
    func startRequest(arguments: PurchaseProductArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Apphud.purchase(arguments) { (response) in
            result(response.toMap())
        }
    }
}

final class  PurchaseProductArgumentParser: Parser {
    typealias ArgumentType = (ApphudProduct)
    
    func parse(args: [String : Any]?) throws -> (ApphudProduct) {
        guard let args = args, let productId = args["productId"] as? String else {
            throw(InternalError(code: "400", message: "productId is required argument"))
        }
        guard let paywallId = args["paywallId"] as? String else {
            throw(InternalError(code: "400", message: "paywallId is required argument"))
        }
        
        var product:ApphudProduct?
        
        let paywalls = Apphud.paywalls ?? []
        
        for paywall in paywalls where product==nil {
            product = paywall.products.first { product in
                return product.productId == productId && product.paywallId == paywallId
            }
        }
        
        guard let product = product else {
            throw(InternalError(code: "400", message: "Cant find product with productId:\(productId) and paywallId:\(paywallId)"))
        }
        
        return product
    }
}
