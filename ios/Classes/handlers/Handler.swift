//
//  Handle.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import Foundation

protocol BaseHandler {
    func isAbleToHandle(method: String) -> Bool
    func tryToHandle(method: String, args: [String: Any]?, result: @escaping FlutterResult)
}

protocol Handler: BaseHandler {
    associatedtype AssociatedEnum: CaseIterable, RawRepresentable
}

extension Handler where AssociatedEnum.RawValue == String {
    func isAbleToHandle(method: String) -> Bool {
        return AssociatedEnum.allCases.contains { route -> Bool in
            route.rawValue == method
        }
    }
}

protocol Request {
    associatedtype ArgumentProvider: Parser
    init()
    func startRequest(arguments: ArgumentProvider.ArgumentType, result: @escaping FlutterResult)
}

protocol Parser {
    associatedtype ArgumentType
    init()
    func parse(args: [String : Any]?) throws -> ArgumentType
}

extension Parser where ArgumentType == () {
    func parse(args: [String : Any]?) -> ArgumentType {
        return ()
    }
}


class Action<R: Request, Argument> where R.ArgumentProvider == Argument {
    private var args: [String : Any]?
    private var result: FlutterResult

    init(args: [String : Any]?, result: @escaping FlutterResult) {
        self.args = args
        self.result = result
    }

    func startFlow() {
        do {
            R.init().startRequest(arguments: try Argument.init().parse(args: args), result: result)
        }
        catch let error as InternalError {
            result(FlutterError(code: error.code, message: error.message, details: nil))
        } catch {
            result(FlutterError(code: "500", message: "", details: nil))
        }
    }
}


enum AppHudMethod {
    enum Initialization: String, CaseIterable {
        case start
        case startManually
        case updateUserID
        case userID
        case deviceID
        case logout
        case setDelegate
        case setUIDelegate
    }

    enum MakePurchase: String, CaseIterable {
        case didFetchProductsNotification
        case productsDidFetchCallback
        case refreshStoreKitProducts
        case products
        case product
        case purchase
        case purchaseWithoutValidation
        case purchasePromo
        case presentOfferCodeRedemptionSheet
        case purchaseProduct
        case didPurchaseFromPaywall
    }

    enum HandlePurchases: String, CaseIterable {
        case hasActiveSubscription
        case subscription
        case subscriptions
        case nonRenewingPurchases
        case isNonRenewingPurchaseActive
        case restorePurchases
        case migratePurchasesIfNeeded
        case fetchRawReceiptInfo
        case validateReceipt
        case appStoreReceipt
        case getPaywalls
        case permissionGroups
        case paywalls
        case paywallsDidLoadCallback
        case hasPremiumAccess
    }

    enum UserProperties: String, CaseIterable {
        case setUserProperty
        case incrementUserProperty
    }

    enum RulesAndScreensMethods: String, CaseIterable {
        case showPendingScreen
        case pendingScreenController
        case pendingRule
    }

    enum PushNotifications: String, CaseIterable {
        case submitPushNotificationsToken
        case handlePushNotification
    }

    enum Attribution: String, CaseIterable {
        case setAdvertisingIdentifier
        case disableIDFACollection
        case addAttribution
        case collectSearchAdsAttribution
    }

    enum EligibilityChecks: String, CaseIterable {
        case checkEligibilityForPromotionalOffer
        case checkEligibilityForIntroductoryOffer
        case checkEligibilitiesForPromotionalOffers
        case checkEligibilitiesForIntroductoryOffers
    }

    enum Others: String, CaseIterable {
       case enableDebugLogs
       case isSandbox
    }
    
    enum PaywallLogs: String, CaseIterable {
        case paywallShown
        case paywallClosed
    }
    
    enum Promotionals: String, CaseIterable {
        case grantPromotional
    }
}

