import ApphudSDK
import AdServices

final class CollectSearchAdsAttributionRequest: Request {
    typealias ArgumentProvider = CollectSearchAdsAttributionParser
    
    func startRequest(arguments: CollectSearchAdsAttributionParser.ArgumentType, result: @escaping FlutterResult) {
        if #available(iOS 14.3, *) {
            DispatchQueue.global(qos: .default).async {
                if let token = try? AAAttribution.attributionToken() {
                    DispatchQueue.main.async {
                        Apphud.addAttribution(data: nil, from: .appleAdsAttribution, identifer: token, callback: nil)
                        result(nil)
                    }
                }
            }
        } else {
            result(nil)
        }
    }
}
    
final class CollectSearchAdsAttributionParser: Parser {
     typealias ArgumentType = ()
}
