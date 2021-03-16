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
            if Apphud.products() != nil {
                guard let product = Apphud.product(productIdentifier: arguments.productId) else {
                    result(FlutterError(code: "500", message: "product with id \(arguments.productId) does not exist", details: nil))
                    return
                }
                Apphud.purchasePromo(product, discountID: arguments.discountID) { (response) in
                    if (response.error != nil) {
                        result(FlutterError(code: "500", message: response.error.debugDescription, details: nil))
                    } else {
                        result(response.toMap())
                    }
                }
            }
            else {
                result(FlutterError(code: "500", message: "product with id \(arguments.productId) have not loaded yet or does not exist", details: nil))
            }
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
