//
//  PurchaseWithoutValidation.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import Foundation
import ApphudSDK

final class PurchaseWithoutValidationRequest: Request {
    typealias ArgumentProvider = PurchaseWithoutValidationArgumentParser

    func startRequest(arguments: (String), result: @escaping FlutterResult) {
        Apphud.purchaseWithoutValidation(arguments) { (response) in
            result(response.toMap())
        }
    }
}

final class  PurchaseWithoutValidationArgumentParser: Parser {
    typealias ArgumentType = (String)

    func parse(args: [String : Any]?) throws -> (String) {
        guard let args = args, let productId = args["productId"] as? String else {
            throw(InternalError(code: "400", message: "productId is required argument"))
        }
        return productId
    }
}
