//
//  HandlePurchasesHandler.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import Foundation

class HandlePurchasesHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.HandlePurchases
    
    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.hasActiveSubscription.rawValue:
            Action<HasActiveSubscriptionRequest,HasActiveSubscriptionArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.subscription.rawValue:
            Action<SubscriptionRequest,SubscriptionArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.subscriptions.rawValue:
            Action<SubscriptionsRequest,SubscriptionsArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.nonRenewingPurchases.rawValue:
            Action<NonRenewingPurchasesRequest,NonRenewingPurchasesArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.isNonRenewingPurchaseActive.rawValue:
            Action<IsNonRenewingPurchaseActiveRequest,IsNonRenewingPurchaseActiveArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.restorePurchases.rawValue:
            Action<RestorePurchasesRequest,RestorePurchasesArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.migratePurchasesIfNeeded.rawValue:
            Action<MigratePurchasesIfNeededRequest,MigratePurchasesIfNeededArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.fetchRawReceiptInfo.rawValue:
            Action<FetchRawReceiptInfoRequest,FetchRawReceiptInfoArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.validateReceipt.rawValue:
            Action<ValidateReceiptRequest,ValidateReceiptArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.appStoreReceipt.rawValue:
            Action<AppStoreReceiptRequest,AppStoreReceiptArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.getPaywalls.rawValue:
            Action<GetPaywallsRequest,GetPaywallsArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.permissionGroups.rawValue:
            Action<PermissionGroupsRequest,PermissionGroupsArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.paywalls.rawValue:
            Action<PaywallsRequest,PaywallsArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.paywallsDidLoadCallback.rawValue:         Action<PaywallsDidLoadCallbackRequest,PaywallsDidLoadCallbackArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.hasPremiumAccess.rawValue:
            Action<HasPremiumAccessRequest,HasPremiumAccessArgumentParser>(args: args, result: result).startFlow()
        default:
            break
        }
    }
}
