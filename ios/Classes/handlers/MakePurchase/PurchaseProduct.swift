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
            let paywallIdentifier = arguments.paywallIdentifier
            let placementIdentifier = arguments.placementIdentifier
            
            var product:ApphudProduct?
            
            if(placementIdentifier != nil) {
                let placements = await Apphud.placements()
                
                for placemnt in placements where product==nil {
                    let paywall = placemnt.paywall
                    if(paywall != nil) {
                        product = paywall!.products.first { product in
                            return product.productId == productId && product.placementIdentifier == placementIdentifier
                        }
                    }
                }
            }
            else if(paywallIdentifier != nil) {
                let paywalls = await Apphud.paywalls()
                
                for paywall in paywalls where product==nil {
                    product = paywall.products.first { product in
                        return product.productId == productId && product.paywallIdentifier == paywallIdentifier
                    }
                }
            }
            
            guard let product = product else {
                result("Cant find product with productId:\(productId), paywallIdentifier:\(String(describing: paywallIdentifier)), placementIdentifier:\(String(describing: placementIdentifier))")
                return
            }
            
            Apphud.purchase(product) { (response) in
                result(response.toMap())
            }

        }
    }
}

final class  PurchaseProductArgumentParser: Parser {
    typealias ArgumentType = (productId:String, paywallIdentifier:String?, placementIdentifier:String?)
    
    func parse(args: [String : Any]?) throws -> (productId:String, paywallIdentifier:String?, placementIdentifier:String?) {
        guard let args = args, let productId = args["productId"] as? String else {
            throw(InternalError(code: "400", message: "productId is required argument"))
        }
        let paywallIdentifier = args["paywallIdentifier"] as? String
        let placementIdentifier = args["placementIdentifier"] as? String
        
        return (productId, paywallIdentifier, placementIdentifier)
    }
}
