//
//  PurchaseProduct.swift
//  apphud
//
//  Created by Nikolay on 10.06.2021.
//

import ApphudSDK

final class PurchaseProductRequest: Request {
    typealias ArgumentProvider = PurchaseProductArgumentParser

    @MainActor func startRequest(arguments: PurchaseProductArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Task { @MainActor in
            guard let product = await ApphudPaywallsHelper.resolveProduct(
                productId: arguments.productId,
                paywallIdentifier: arguments.paywallIdentifier,
                placementIdentifier: arguments.placementIdentifier
            ) else {
                result(FlutterError(
                    code: "400",
                    message: "Can't find product with productId: \(arguments.productId), paywallIdentifier: \(arguments.paywallIdentifier ?? "nil"), placementIdentifier: \(arguments.placementIdentifier ?? "nil")",
                    details: nil
                ))
                return
            }

            Apphud.purchase(product) { response in
                result(response.toMap())
            }
        }
    }
}

final class PurchaseProductArgumentParser: Parser {
    typealias ArgumentType = (productId: String, paywallIdentifier: String?, placementIdentifier: String?)

    func parse(args: [String: Any]?) throws -> ArgumentType {
        guard let args = args, let productId = args["productId"] as? String else {
            throw InternalError(code: "400", message: "productId is required argument")
        }
        let paywallIdentifier = args["paywallIdentifier"] as? String
        let placementIdentifier = args["placementIdentifier"] as? String
        return (productId, paywallIdentifier, placementIdentifier)
    }
}
