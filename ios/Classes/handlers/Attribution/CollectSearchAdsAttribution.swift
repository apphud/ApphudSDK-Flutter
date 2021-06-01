import ApphudSDK
import iAd

final class CollectSearchAdsAttributionRequest: Request {
    typealias ArgumentProvider = CollectSearchAdsAttributionParser

   func startRequest(arguments: CollectSearchAdsAttributionParser.ArgumentType, result: @escaping FlutterResult) {
        ADClient.shared().requestAttributionDetails { (data, error) in
                 if let data = data {
                     Apphud.addAttribution(data: data, from: .appleSearchAds, callback: nil)
                     result(nil)
                 } else {
                      result(error == nil ? nil : ["message": error?.localizedDescription])
                 }
             }
       }
}

final class CollectSearchAdsAttributionParser: Parser {
    typealias ArgumentType = ()
}
