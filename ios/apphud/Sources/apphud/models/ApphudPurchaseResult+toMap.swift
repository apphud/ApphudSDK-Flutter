//
//  ApphudPurchaseResult+toMap.swift
//  appHud
//
//  Created by Stanislav on 16.02.2021.
//

import ApphudSDK
import Foundation
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
                "error": errorMap(),
                "transaction": transactionMap(),
                "isRestore": isRestoreResult
        ]
    }

    /// A purchase awaiting approval (Ask to Buy) reports no error, so Dart gets one: the
    /// purchase hasn't happened. The approved transaction arrives later as a subscription update.
    func errorMap() -> [String: Any?]? {
        if let error {
            return error.toApphudErrorMap()
        }
        guard isPending else { return nil }
        return [
            "message": "Purchase is pending approval",
            "errorCode": nil,
            "networkIssue": false,
            "billingResponseCode": nil,
            "billingErrorTitle": nil,
        ]
    }

    /// SDK purchases run on StoreKit 2 and leave the StoreKit 1 `transaction` empty: Dart gets
    /// the same fields from the StoreKit 2 transaction.
    func transactionMap() -> [String: Any?]? {
        if let transaction {
            return transaction.toMap()
        }
        guard let transactionV2 else { return nil }
        return ["transactionIdentifier": String(transactionV2.id),
                "transactionDate": transactionV2.purchaseDate.timeIntervalSince1970,
                "productIdentifier": transactionV2.productID,
                "state": SKPaymentTransactionState.purchased.rawValue
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
            "errorCode": storeKit1ErrorCode(for: self)?.rawValue ?? nsError.code,
            "networkIssue": isNetworkIssue,
            "billingResponseCode": nil,
            "billingErrorTitle": nil,
        ]
    }
}

/// SDK purchases run on StoreKit 2: its errors get the StoreKit 1 codes Dart got before, so a
/// cancel is still `SKError.paymentCancelled`. Nil for errors that don't come from StoreKit 2.
fileprivate func storeKit1ErrorCode(for error: Error) -> SKError.Code? {
    if let storeKitError = error as? StoreKitError {
        switch storeKitError {
        case .userCancelled:
            return .paymentCancelled
        case .networkError:
            return .cloudServiceNetworkConnectionFailed
        case .notAvailableInStorefront:
            return .storeProductNotAvailable
        case .systemError(let underlyingError):
            return (underlyingError as? SKError)?.code ?? .unknown
        default:
            return .unknown
        }
    }
    if let purchaseError = error as? Product.PurchaseError {
        switch purchaseError {
        case .invalidQuantity:
            return .paymentInvalid
        case .productUnavailable:
            return .storeProductNotAvailable
        case .purchaseNotAllowed:
            return .paymentNotAllowed
        case .ineligibleForOffer:
            return .ineligibleForOffer
        case .invalidOfferIdentifier:
            return .invalidOfferIdentifier
        case .invalidOfferPrice:
            return .invalidOfferPrice
        case .invalidOfferSignature:
            return .invalidSignature
        case .missingOfferParameters:
            return .missingOfferParams
        default:
            return .unknown
        }
    }
    return nil
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
