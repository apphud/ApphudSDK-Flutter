//
//  RestorePurchases.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import ApphudSDK

final class RestorePurchasesRequest: Request {
    typealias ArgumentProvider = RestorePurchasesArgumentParser
    
    func startRequest(arguments: RestorePurchasesArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Apphud.restorePurchases { (subscriptions, nrPurchases, error) in
                let subscriptionsJson = subscriptions?.map({ subscription in
                    subscription.toMap()
                })
                
                let nrPurchasesJson = nrPurchases?.map({ purchases in
                    purchases.toMap()
                })
                
                result(["subscriptions": subscriptionsJson,
                        "nrPurchases": nrPurchasesJson,
                        "error": error == nil ? nil : ["message": error?.localizedDescription],
                       ])
        }
    }
}

final class RestorePurchasesArgumentParser: Parser {
    typealias ArgumentType = ()
}
