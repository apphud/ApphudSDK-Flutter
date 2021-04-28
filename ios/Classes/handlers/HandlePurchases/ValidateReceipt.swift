import ApphudSDK

final class ValidateReceiptRequest: Request {
    typealias ArgumentProvider = ValidateReceiptArgumentParser
    
    func startRequest(arguments: ValidateReceiptArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Apphud.validateReceipt { (subscriptions, nrPurchases, error) in
            if (error != nil) {
                result(FlutterError(code: "500", message: error.debugDescription, details: nil))
            } else {
                let subscriptionsJson = subscriptions?.map({ subscription in
                    subscription.toMap()
                })
                
                let nrPurchasesJson = nrPurchases?.map({ purchases in
                    purchases.toMap()
                })
                
                result(["subscriptions": subscriptionsJson,
                        "nrPurchases": nrPurchasesJson])}
            
        }
        
    }
}

final class ValidateReceiptArgumentParser: Parser {
    typealias ArgumentType = ()
}
