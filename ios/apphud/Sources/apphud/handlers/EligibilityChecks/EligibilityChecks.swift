//
//  EligibilityChecks.swift
//  appHud
//
//  Implementations of `Apphud.checkEligibilityFor*` and the batch
//  `Apphud.checkEligibilitiesFor*` methods.
//

import Flutter
import Foundation
import StoreKit
import ApphudSDK

// MARK: - Single product

final class CheckEligibilityForIntroductoryOfferRequest: Request {
    typealias ArgumentProvider = SingleProductIdParser

    func startRequest(arguments: String, result: @escaping FlutterResult) {
        guard let product = Apphud.product(productIdentifier: arguments) else {
            result(false)
            return
        }
        Apphud.checkEligibilityForIntroductoryOffer(product: product) { eligible in
            result(eligible)
        }
    }
}

final class CheckEligibilityForPromotionalOfferRequest: Request {
    typealias ArgumentProvider = SingleProductIdParser

    func startRequest(arguments: String, result: @escaping FlutterResult) {
        guard let product = Apphud.product(productIdentifier: arguments) else {
            result(false)
            return
        }
        Apphud.checkEligibilityForPromotionalOffer(product: product) { eligible in
            result(eligible)
        }
    }
}

final class SingleProductIdParser: Parser {
    typealias ArgumentType = String

    func parse(args: [String : Any]?) throws -> String {
        guard let args = args, let productId = args["productId"] as? String else {
            throw InternalError(code: "400", message: "productId is required argument")
        }
        return productId
    }
}

// MARK: - Batch

final class CheckEligibilitiesForIntroductoryOffersRequest: Request {
    typealias ArgumentProvider = ProductIdsParser

    func startRequest(arguments: [String], result: @escaping FlutterResult) {
        let resolved = resolveProducts(productIds: arguments)
        guard !resolved.products.isEmpty else {
            result(resolved.notFound)
            return
        }
        Apphud.checkEligibilitiesForIntroductoryOffers(products: resolved.products) { map in
            var merged = resolved.notFound
            for (key, value) in map { merged[key] = value }
            result(merged)
        }
    }
}

final class CheckEligibilitiesForPromotionalOffersRequest: Request {
    typealias ArgumentProvider = ProductIdsParser

    func startRequest(arguments: [String], result: @escaping FlutterResult) {
        let resolved = resolveProducts(productIds: arguments)
        guard !resolved.products.isEmpty else {
            result(resolved.notFound)
            return
        }
        Apphud.checkEligibilitiesForPromotionalOffers(products: resolved.products) { map in
            var merged = resolved.notFound
            for (key, value) in map { merged[key] = value }
            result(merged)
        }
    }
}

final class ProductIdsParser: Parser {
    typealias ArgumentType = [String]

    func parse(args: [String : Any]?) throws -> [String] {
        guard let args = args, let productIds = args["productIds"] as? [String] else {
            throw InternalError(code: "400", message: "productIds is required argument")
        }
        return productIds
    }
}

// MARK: - Helpers

private struct ResolvedProducts {
    let products: [SKProduct]
    /// Map of productIds that could not be resolved to an `SKProduct`,
    /// pre-filled with `false` so the Flutter side always gets an answer
    /// for every requested productId.
    let notFound: [String: Bool]
}

private func resolveProducts(productIds: [String]) -> ResolvedProducts {
    var products: [SKProduct] = []
    var notFound: [String: Bool] = [:]
    for productId in productIds {
        if let product = Apphud.product(productIdentifier: productId) {
            products.append(product)
        } else {
            notFound[productId] = false
        }
    }
    return ResolvedProducts(products: products, notFound: notFound)
}
