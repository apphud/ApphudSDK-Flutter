//
//  ApphudUser+toMap.swift
//  apphud
//
//  Created by Nikolay Ivanov on 21.01.2024.
//

import Foundation
import ApphudSDK

extension ApphudUser{
    @MainActor func toMap() -> [String: Any?] {
        let map: [String: Any?] = [
          "userId": userId,
          "subscriptions": subscriptions.map({ s in s.toMap() }),
          "purchases": purchases.map({ p in p.toMap() }),
          "rawPlacements": rawPlacements().map({ p in p.toMap() }),
          "rawPaywalls": rawPlacements().compactMap(\.paywall).map({ p in p.toMap() }),
          "hasPurchases": !(subscriptions.isEmpty && purchases.isEmpty)
      ]
      return map
    }
}
