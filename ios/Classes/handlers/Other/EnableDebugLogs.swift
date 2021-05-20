import ApphudSDK

final class EnableDebugLogsRequest: Request {
    typealias ArgumentProvider = EnableDebugLogsArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.enableDebugLogs()
        result(nil)
    }
}

final class EnableDebugLogsArgumentParser: Parser {
    typealias ArgumentType = ()
}
