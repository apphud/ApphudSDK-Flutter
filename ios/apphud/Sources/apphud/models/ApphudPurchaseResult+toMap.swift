//
//  ApphudPurchaseResult+toMap.swift
//  appHud
//
//  Created by Stanislav on 16.02.2021.
//

import ApphudSDK
import StoreKit

extension String {
    var apphudIsNumeric: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

fileprivate func platform(string: String) -> String {
    if string.apphudIsNumeric {
        return "ios"
    } else if string.contains("GPA") {
        return "android"
    } else {
        return "web"
    }
}

extension ApphudPurchaseResult {
    func toMap() -> [String: Any?] {
        return ["subscription" : subscription?.toMap(),
                "nonRenewingPurchase" : nonRenewingPurchase?.toMap(),
                "error": error?.toApphudErrorMap(),
                "transaction": transaction?.toMap(),
                "isRestore": isRestoreResult
        ]
    }
}

extension Error {
    /// Maps a native error coming from `ApphudPurchaseResult.error`, `Apphud.fetchPlacements`,
    /// `Apphud.loadFallbackPaywalls`, `Apphud.restorePurchases`, or `Apphud.fetchPaywallScreen`
    /// into a dictionary that matches the
    /// shape of `ApphudError` on the Dart side. Without this mapping `networkIssue` and `errorCode`
    /// are always `false` / `nil` in Flutter on iOS, which makes offline detection impossible.
    func toApphudErrorMap() -> [String: Any?] {
        let nsError = self as NSError
        let isNetworkIssue: Bool
        if let apphudError = self as? ApphudError {
            isNetworkIssue = apphudError.networkIssue()
        } else {
            // Same set of codes ApphudError.networkIssue() considers a network issue.
            let noInternetCodes: Set<Int> = [
                NSURLErrorNotConnectedToInternet,
                NSURLErrorCannotConnectToHost,
                NSURLErrorCannotFindHost,
                APPHUD_ERROR_NO_INTERNET,
            ]
            isNetworkIssue = noInternetCodes.contains(nsError.code)
        }
        return [
            "message": localizedDescription,
            "errorCode": nsError.code,
            "networkIssue": isNetworkIssue,
            "billingResponseCode": nil,
            "billingErrorTitle": nil,
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
                "platform" : platform(string: originalTransactionId ?? "0"),
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
                "isActive" : isActive(),
                "platform" : platform(string: transactionId ?? "0"),
                "isSandbox": isSandbox,
                "isLocal": isLocal
        ]
    }
}

extension SKPaymentTransaction {
    func toMap() -> [String: Any?] {
        return ["transactionIdentifier":transactionIdentifier,
                "transactionDate":transactionDate?.timeIntervalSince1970,
                "productIdentifier": payment.productIdentifier,
                "state":transactionState.rawValue
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
