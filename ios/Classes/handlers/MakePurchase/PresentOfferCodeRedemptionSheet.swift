import ApphudSDK

final class PresentOfferCodeRedemptionSheetRequest: Request {
    typealias ArgumentProvider = PresentOfferCodeRedemptionSheet

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.presentOfferCodeRedemptionSheet()
        result(nil)
    }
}

final class PresentOfferCodeRedemptionSheetParser: Parser {
    typealias ArgumentType = ()
}
