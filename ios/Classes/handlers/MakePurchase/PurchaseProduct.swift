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
    
    @MainActor func startRequest(arguments: PurchaseProductArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Task {@MainActor in
            let productId = arguments.productId
            let paywallId = arguments.paywallId
            
            var product:ApphudProduct?
            
            let paywalls = await Apphud.paywalls()
            
            for paywall in paywalls where product==nil {
                product = paywall.products.first { product in
                    return product.productId == productId && product.paywallId == paywallId
                }
            }
            
            guard let product = product else {
                result("Cant find product with productId:\(productId) and paywallId:\(paywallId)")
                return
            }
            
            Apphud.purchase(product) { (response) in
                result(response.toMap())
            }

        }
    }
}

final class  PurchaseProductArgumentParser: Parser {
    typealias ArgumentType = (productId:String, paywallId:String)
    
    func parse(args: [String : Any]?) throws -> (productId:String, paywallId:String) {
        guard let args = args, let productId = args["productId"] as? String else {
            throw(InternalError(code: "400", message: "productId is required argument"))
        }
        guard let paywallId = args["paywallId"] as? String else {
            throw(InternalError(code: "400", message: "paywallId is required argument"))
        }
        
        return (productId, paywallId)
    }
}
