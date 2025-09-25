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
                
                result(["subscriptions": [subscriptionJson],
                        "nrPurchases": [nrPurchaseJson],
                        "error": restoreResult.error == nil ? nil : ["message": restoreResult.error?.localizedDescription],
                       ])
        }
    }
}

final class RestorePurchasesArgumentParser: Parser {
    typealias ArgumentType = ()
}
