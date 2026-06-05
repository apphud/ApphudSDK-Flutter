import ApphudSDK

final class UpdateBaseUrlRequest: Request {
    typealias ArgumentProvider = UpdateBaseUrlArgumentParser
    
    func startRequest(arguments: ArgumentProvider.ArgumentType, result: @escaping FlutterResult) {
        ApphudHttpClient.shared.domainUrlString = arguments
        result(nil)
    }
}

final class UpdateBaseUrlArgumentParser: Parser {
    typealias ArgumentType = String
    
    func parse(args: [String : Any]?) throws -> String {
        guard let args = args, let url = args["url"] as? String else {
            throw(InternalError(code: "400", message: "url is required argument"))
        }
        return url
    }
}

