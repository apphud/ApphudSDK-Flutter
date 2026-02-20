//
//  RestorePurchases.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import ApphudSDK

final class RestorePurchasesRequest: @preconcurrency Request {
    typealias ArgumentProvider = RestorePurchasesArgumentParser
    
    @MainActor func startRequest(arguments: RestorePurchasesArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Apphud.restorePurchases { restoreResult in
            
            let subscriptionJson = restoreResult.subscription?.toMap()
                
            let nrPurchaseJson = restoreResult.nonRenewingPurchase?.toMap()
                
            var dict: [String: Any] = [
                "subscriptions": subscriptionJson != nil ? [subscriptionJson] : [],
                "nrPurchases": nrPurchaseJson != nil ? [nrPurchaseJson] : [],
            ]
            if restoreResult.error != nil {
                dict["error"] = ["message": restoreResult.error?.localizedDescription ?? ""]
            }
            
            result(dict)
        }
    }
}

final class RestorePurchasesArgumentParser: Parser {
    typealias ArgumentType = ()
}
