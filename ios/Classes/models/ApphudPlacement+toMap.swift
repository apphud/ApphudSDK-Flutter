//
//  ApphudPlacement+toMap.swift
//  apphud
//
//  Created by Nikolay Ivanov on 21.01.2024.
//

import Foundation
import ApphudSDK

extension ApphudPlacement {
    func toMap() -> [String: Any?] {
      var map: [String: Any?] = [
          "identifier": identifier,
          "paywall": paywall?.toMap(),
          "experimentName": experimentName,
      ]
      return map
    }
}

