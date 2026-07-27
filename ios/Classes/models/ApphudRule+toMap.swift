//
//  ApphudRule+toMap.swift
//  apphud
//

import ApphudSDK

extension ApphudRule {
    func toMap() -> [String: Any?] {
        return [
            "ruleName": rule_name,
            "screenName": screen_name,
            "screenId": screen_id,
            "paywallId": paywall_id,
            "paywallIdentifier": paywall_identifier,
        ]
    }
}
