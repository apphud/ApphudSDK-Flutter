//
//  ApphudPurchaseResult+toMap.swift
//  appHud
//
//  Created by Stanislav on 16.02.2021.
//

import ApphudSDK
import StoreKit

extension ApphudPurchaseResult {
    func toMap() -> [String: Any?] {
        return ["subscription" : subscription?.toMap(),
                "nonRenewingPurchase" : nonRenewingPurchase?.toMap(),
                "error": error == nil ? nil : ["message": error?.localizedDescription],
                "transaction": transaction?.toMap()
        ]
    }
}

extension ApphudSubscription {
    func toMap() -> [String: Any?] {
        return ["productId": productId,
                "expiresAt": expiresDate.timeIntervalSince1970,
                "startedAt": startedAt.timeIntervalSince1970,
                "canceledAt": canceledAt?.timeIntervalSince1970,
                "isInRetryBilling": isInRetryBilling,
                "isAutorenewEnabled": isAutorenewEnabled,
                "isIntroductoryActivated": isIntroductoryActivated,
                "isActive" : isActive(),
                "status" : status.toString(),
                "isSandbox" : isSandbox,
                "isLocal" : isLocal
        ]
    }
}

extension ApphudSubscriptionStatus {
    func toString() -> String {

        switch self {
        case .trial:
            return "trial"
        case .intro:
            return "intro"
        case .promo:
            return "promo"
        case .grace:
            return "grace"
        case .regular:
            return "regular"
        case .refunded:
            return "refunded"
        case .expired:
            return "expired"
        default:
            return ""
        }
    }
}

extension ApphudNonRenewingPurchase {
    func toMap() -> [String: Any?] {
        return ["productId": productId as Any,
                "purchasedAt": purchasedAt.timeIntervalSince1970,
                "canceledAt": canceledAt?.timeIntervalSince1970,
                "isSandbox" : isSandbox,
                "isLocal" : isLocal,
                "isActive" : isActive()
        ]
    }
}

extension SKPaymentTransaction {
    func toMap() -> [String: Any?] {
        return ["transactionIdentifier":transactionIdentifier,
                "transactionDate":transactionDate?.timeIntervalSince1970,
                "payment": payment.toMap()
        ]
    }
}

extension SKPayment {
    func toMap() -> [String: Any?] {
        return [ "productIdentifier": productIdentifier,
                 "description": description.description,
                 "applicationUsername": applicationUsername,
                 "quantity": quantity
        ]
    }
}
