//
//  Product.swift
//  appHud
//
//  Created by Stanislav on 10.02.2021.
//

import ApphudSDK

final class ProductRequest: Request {
    typealias ArgumentProvider = ProductArgumentParser

    func startRequest(arguments: (String), result: @escaping FlutterResult) {
        let response = Apphud.product(productIdentifier: arguments)
        result(response?.toMap())
    }
}

final class  ProductArgumentParser: Parser {
    typealias ArgumentType = (String)
    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let productIdentifier = args["productIdentifier"] as? String else {
            throw(InternalError(code: "400", message: "productIdentifier is required argument"))
        }
        return (productIdentifier)
    }
}
