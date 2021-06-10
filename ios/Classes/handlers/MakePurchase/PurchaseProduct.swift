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
        guard let args = args, let _ = args["productId"] as? String else {
            throw(InternalError(code: "400", message: "productId is required argument"))
        }
        let jsonData = try JSONSerialization.data(withJSONObject: args)
        let decoder = JSONDecoder()
        let product = try decoder.decode(ApphudProduct.self, from: jsonData)
        return product
    }
}
