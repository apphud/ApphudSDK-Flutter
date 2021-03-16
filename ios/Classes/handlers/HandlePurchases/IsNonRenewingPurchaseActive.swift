//
//  IsNonRenewingPurchaseActive.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import ApphudSDK

final class IsNonRenewingPurchaseActiveRequest: Request {
    typealias ArgumentProvider = IsNonRenewingPurchaseActiveArgumentParser

    func startRequest(arguments: (String), result: @escaping FlutterResult) {
        let response: Bool = Apphud.isNonRenewingPurchaseActive(productIdentifier: arguments)
        result(response)
    }
}

final class IsNonRenewingPurchaseActiveArgumentParser: Parser {
    typealias ArgumentType = (String)

    func parse(args: [String : Any]?) throws -> (String) {
        guard let args = args, let productIdentifier = args["productIdentifier"] as? String else {
            throw(InternalError(code: "400", message: "productIdentifier is required argument"))
        }
        return productIdentifier
    }
}
