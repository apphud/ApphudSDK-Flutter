//
//  PurchasePromo.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import Foundation
import ApphudSDK

final class PurchasePromoRequest: Request {
    typealias ArgumentProvider = PurchasePromoArgumentParser

    func startRequest(arguments: (productId: String, discountID: String), result: @escaping FlutterResult) {
        if #available(iOS 12.2, *) {
            if Apphud.products != nil {
                guard let product = Apphud.product(productIdentifier: arguments.productId) else {
                    result(["error" : "product with id \(arguments.productId) does not exist"])
                    return
                }
                Apphud.purchasePromo(product, discountID: arguments.discountID) { (response) in
                    result(response.toMap())
                }
            }
            else {
                result(["error" : "product with id \(arguments.productId) have not loaded yet or does not exist"])
            }
        }
        else {
            result(["error" : "Apphud.purchasePromo is available only on iOS >= 12.2"])
        }
    }
}

final class  PurchasePromoArgumentParser: Parser {
    typealias ArgumentType = (productId: String,discountID: String)


    func parse(args: [String : Any]?) throws -> (productId: String, discountID: String) {
        guard let args = args,
              let productId = args["productId"] as? String,
              let discountID = args["discountID"] as? String else {
            throw(InternalError(code: "400", message: "productId and discountID are required arguments"))
        }
        return (productId: productId, discountID: discountID)
    }
}
