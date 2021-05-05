import ApphudSDK

final class ValidateReceiptRequest: Request {
    typealias ArgumentProvider = ValidateReceiptArgumentParser
    
    func startRequest(arguments: ValidateReceiptArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Apphud.validateReceipt { (subscriptions, nrPurchases, error) in
                let subscriptionsJson = subscriptions?.map({ subscription in
                    subscription.toMap()
                })
                
                let nrPurchasesJson = nrPurchases?.map({ purchases in
                    purchases.toMap()
                })
                
                result(["subscriptions": subscriptionsJson,
                        "nrPurchases": nrPurchasesJson,
                        "error" : error?.localizedDescription
                        ])
        }
    }
}

final class ValidateReceiptArgumentParser: Parser {
    typealias ArgumentType = ()
}
