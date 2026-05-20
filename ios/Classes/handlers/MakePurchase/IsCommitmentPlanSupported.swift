//
//  IsCommitmentPlanSupported.swift
//  apphud
//

import ApphudSDK

final class IsCommitmentPlanSupportedRequest: Request {
    typealias ArgumentProvider = IsCommitmentPlanSupportedArgumentParser

    @MainActor func startRequest(arguments: IsCommitmentPlanSupportedArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Task { @MainActor in
            let productId = arguments.productId
            let paywallIdentifier = arguments.paywallIdentifier
            let placementIdentifier = arguments.placementIdentifier

            guard let product = await ApphudPaywallsHelper.resolveProduct(
                productId: productId,
                paywallIdentifier: paywallIdentifier,
                placementIdentifier: placementIdentifier
            ) else {
                result(false)
                return
            }

            if #available(iOS 26.4, macOS 26.4, tvOS 26.4, watchOS 26.4, visionOS 26.4, *) {
                let supported = await product.isCommitmentPlanSupported()
                result(supported)
            } else {
                result(false)
            }
        }
    }
}

final class IsCommitmentPlanSupportedArgumentParser: Parser {
    typealias ArgumentType = (productId: String, paywallIdentifier: String?, placementIdentifier: String?)

    func parse(args: [String: Any]?) throws -> (productId: String, paywallIdentifier: String?, placementIdentifier: String?) {
        guard let args = args, let productId = args["productId"] as? String else {
            throw InternalError(code: "400", message: "productId is required argument")
        }
        let paywallIdentifier = args["paywallIdentifier"] as? String
        let placementIdentifier = args["placementIdentifier"] as? String
        return (productId, paywallIdentifier, placementIdentifier)
    }
}
