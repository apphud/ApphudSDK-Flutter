import ApphudSDK

final class EnableDebugLogsRequest: Request {
    typealias ArgumentProvider = EnableDebugLogsArgumentParser
    
    func startRequest(arguments: ArgumentProvider.ArgumentType, result: @escaping FlutterResult) {
        if(arguments == 0) {
            Apphud.enableDebugLogs()
        } else {
            ApphudUtils.enableAllLogs();
        }
        result(nil)
    }
}

final class EnableDebugLogsArgumentParser: Parser {
    typealias ArgumentType = (Int)
    
    func parse(args: [String : Any]?) throws -> (Int) {
        let level = args?["level"] as? Int ?? 0
        return level
    }
}
