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

            guard let product = await Self.resolveProduct(
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

    @MainActor private static func resolveProduct(
        productId: String,
        paywallIdentifier: String?,
        placementIdentifier: String?
    ) async -> ApphudProduct? {
        if placementIdentifier != nil {
            let placements = await Apphud.placements()
            for placement in placements {
                guard let paywall = placement.paywall else { continue }
                if let product = paywall.products.first(where: {
                    $0.productId == productId && $0.placementIdentifier == placementIdentifier
                }) {
                    return product
                }
            }
        } else if paywallIdentifier != nil {
            let paywalls = await ApphudPaywallsHelper.getPaywalls()
            for paywall in paywalls {
                if let product = paywall.products.first(where: {
                    $0.productId == productId && $0.paywallIdentifier == paywallIdentifier
                }) {
                    return product
                }
            }
        }
        return nil
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
