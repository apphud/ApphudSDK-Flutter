//
//  PluginApphudDelegate.swift
//  appHud
//
//  Created by Stanislav on 06.02.2021.
//

import ApphudSDK
import StoreKit

class PluginApphudDelegate: ApphudDelegate {
    func apphudSubscriptionsUpdated(_ subscriptions: [ApphudSubscription]) {}
    func apphudNonRenewingPurchasesUpdated(_ purchases: [ApphudNonRenewingPurchase]){}
    func apphudDidChangeUserID(_ userID: String){}
    func apphudDidFetchStoreKitProducts(_ products: [SKProduct]){}
//    func apphudShouldStartAppStoreDirectPurchase(_ product: SKProduct) -> ((ApphudPurchaseResult) -> Void)?{}
//    func apphudProductIdentifiers() -> [String] {}
}
