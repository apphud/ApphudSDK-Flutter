import ApphudSDK

final class PresentOfferCodeRedemptionSheetRequest: Request {
    typealias ArgumentProvider = PresentOfferCodeRedemptionSheetArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
    if #available(iOS 14.0, *) {
        Apphud.presentOfferCodeRedemptionSheet()
        result(nil)
      }
      else {
        result(FlutterError(code: "500", message: "Not available for this version", details: nil))
      }
    }
}

final class PresentOfferCodeRedemptionSheetArgumentParser: Parser {
    typealias ArgumentType = ()
}
