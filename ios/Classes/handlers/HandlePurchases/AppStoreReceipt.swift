import ApphudSDK

final class AppStoreReceiptRequest: Request {
    typealias ArgumentProvider = AppStoreReceiptArgumentParser

    func startRequest(arguments: AppStoreReceiptArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        let response = Apphud.appStoreReceipt()
        result(response)
    }
}

final class AppStoreReceiptArgumentParser: Parser {
    typealias ArgumentType = ()
}
