//
//  MigratePurchasesIfNeeded.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import ApphudSDK

final class MigratePurchasesIfNeededRequest: Request {
    typealias ArgumentProvider = MigratePurchasesIfNeededArgumentParser

    func startRequest(arguments: MigratePurchasesIfNeededArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Apphud.migratePurchasesIfNeeded { (subscriptions, nrPurchases, error) in
            if (error != nil) {
                result(FlutterError(code: "500", message: error.debugDescription, details: nil))
            }
            else {
                let subscriptionsJson = subscriptions?.map({ subscription in
                    subscription.toMap()
                })

                let nrPurchasesJson = nrPurchases?.map({ purchases in
                    purchases.toMap()
                })

                result(["subscriptions": subscriptionsJson,
                        "nrPurchases": nrPurchasesJson])

            }
        }
    }
}

final class MigratePurchasesIfNeededArgumentParser: Parser {
    typealias ArgumentType = ()
}
