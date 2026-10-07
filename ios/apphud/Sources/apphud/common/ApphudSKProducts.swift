//
//  ApphudSKProducts.swift
//  apphud
//

import ApphudSDK
import StoreKit

/// The native SDK reports placements as ready once StoreKit 2 products load, and fetches the
/// `SKProduct`s this bridge sends to Dart in parallel; that fetch may finish later. The bridge
/// waits for it before sending placements and paywalls.
enum ApphudSKProducts {
    private static let timeout: TimeInterval = 5
    // Set after a wait on placements loaded without an error timed out: the StoreKit 1 fetch
    // delivered nothing or took longer, and the next calls don't wait.
    @MainActor private static var gaveUp = false

    /// What `Apphud.placements()` returns, once the `SKProduct`s are loaded.
    @MainActor static func placements() async -> [ApphudPlacement] {
        let (placements, error) = await withCheckedContinuation { continuation in
            Apphud.fetchPlacements { placements, error in
                continuation.resume(returning: (placements, error))
            }
        }
        if error == nil {
            await waitUntilLoaded(for: placements)
        }
        return placements
    }

    /// Call once placements or paywalls are loaded. Waits only while one of `products` has no
    /// `SKProduct` and no `SKProduct`s have been loaded yet. A call that can't tell whether the
    /// load failed passes `canGiveUp: false`, so its timeout doesn't stop the next waits.
    @MainActor static func waitUntilLoaded(for products: [ApphudProduct], canGiveUp: Bool = true) async {
        guard !gaveUp, products.contains(where: { skProduct(for: $0) == nil }) else { return }
        let deadline = Date().addingTimeInterval(timeout)
        while Apphud.products == nil {
            guard Date() < deadline else {
                if canGiveUp { gaveUp = true }
                return
            }
            try? await Task.sleep(nanoseconds: 100_000_000)
        }
    }

    @MainActor static func waitUntilLoaded(for placements: [ApphudPlacement], canGiveUp: Bool = true) async {
        await waitUntilLoaded(for: placements.flatMap { $0.paywall?.products ?? [] }, canGiveUp: canGiveUp)
    }

    /// The product's `skProduct`, or the same product from the loaded `SKProduct`s while the SDK
    /// hasn't attached it to the paywall yet.
    static func skProduct(for product: ApphudProduct) -> SKProduct? {
        product.skProduct ?? Apphud.product(productIdentifier: product.productId)
    }
}
