//
//  ApphudDelegateHandler.swift
//  apphud
//
//  Created by Nikolay on 28.01.2022.
//

import Foundation
import ApphudSDK
import StoreKit

public class ApphudDelegateHandler: NSObject, FlutterPlugin, ApphudDelegate {
    internal init(channel: FlutterMethodChannel) {
        self.channel = channel
    }
    
    private var isListeningStarted: Bool = false
    private var channel: FlutterMethodChannel
    
    public static func register(with registrar: FlutterPluginRegistrar) {}
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method

        switch (method) {
            case "startListening":
                start()
                break;
            case "stopListening":
                stop()
                break;
            default:
                break;
        }
    }
    
    private func start() {
        isListeningStarted = true
        Apphud.setDelegate(self)
    }
    private func stop() {
        isListeningStarted = false
    }
    
    public func paywallsDidFullyLoad(paywalls:[ApphudPaywall]) {
        if(isListeningStarted){
            channel.invokeMethod("paywallsDidFullyLoad",
                                 arguments: [
                                            "paywalls" : paywalls.map({ (paywall: ApphudPaywall) in paywall.toMap() }),
                                            ])
        }
    }
    
    public func apphudDidFetchStoreKitProducts(_ products: [SKProduct], _ error: Error?) {
        if(error == nil && isListeningStarted) {
            channel.invokeMethod("fetchNativeProducts",
                                 arguments: products.map{ product in product.toMap()})
        }
    }
    
    public func apphudSubscriptionsUpdated(_ subscriptions: [ApphudSubscription]) {
        if(isListeningStarted) {
            channel.invokeMethod("apphudSubscriptionsUpdated",
                                 arguments: subscriptions.map{ sub in sub.toMap()})
        }
    }

    public func apphudNonRenewingPurchasesUpdated(_ purchases: [ApphudNonRenewingPurchase]) {
        if(isListeningStarted){
            channel.invokeMethod("apphudNonRenewingPurchasesUpdated",
                                 arguments: purchases.map{ sub in sub.toMap()})
        }
    }

    public func apphudDidChangeUserID(_ userID: String) {
        if(isListeningStarted) {
            channel.invokeMethod("didChangeUserID", arguments:userID)
        }
    }
    
    public func userDidLoad(rawPaywalls:[ApphudPaywall]) {
        if(isListeningStarted){
            channel.invokeMethod("userDidLoad",
                                 arguments: [
                                            "paywalls" : rawPaywalls.map({ (paywall: ApphudPaywall) in paywall.toMap() }),
                                            ])
        }
    }
}
