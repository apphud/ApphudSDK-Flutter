//
//  Purchase.swift
//  appHud
//
//  Created by Stanislav on 10.02.2021.
//

import ApphudSDK
import StoreKit

final class PurchaseRequest: Request {
    typealias ArgumentProvider = PurchaseArgumentParser

    func startRequest(arguments: (String), result: @escaping FlutterResult) {
        Apphud.purchase(arguments) { (response) in
            if (response.error != nil) {
                result(FlutterError(code: "500", message: response.error.debugDescription, details: nil))
            } else {
                result(response.toMap())
            }
        }
    }
}

final class  PurchaseArgumentParser: Parser {
    typealias ArgumentType = (String)

    func parse(args: [String : Any]?) throws -> (String) {
        guard let args = args, let productId = args["productId"] as? String else {
            throw(InternalError(code: "400", message: "productId is required argument"))
        }
        return productId
    }
}
