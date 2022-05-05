//
//  DidPurchaseFRomPaywall.swift
//  apphud
//
//  Created by Nikolay on 03.05.2022.
//

import ApphudSDK
import StoreKit

final class DidPurchaseFromPaywallRequest: Request {
    typealias ArgumentProvider = DidPurchaseFromPaywallArgumentParser

    func startRequest(arguments paywallIdentifier: (String), result: @escaping FlutterResult) {
        Apphud.willPurchaseProductFromPaywall(paywallIdentifier)
        result(nil)
    }
}

final class  DidPurchaseFromPaywallArgumentParser: Parser {
    typealias ArgumentType = (String)

    func parse(args: [String : Any]?) throws -> (String) {
        guard let args = args, let paywallIdentifier = args["paywallIdentifier"] as? String else {
            throw(InternalError(code: "400", message: "paywallIdentifier is required argument"))
        }
        return paywallIdentifier
    }
}
