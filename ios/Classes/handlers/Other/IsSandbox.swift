import ApphudSDK

final class IsSandboxRequest: Request {
    typealias ArgumentProvider = IsSandboxArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        let response: Bool = Apphud.isSandbox()
        result(response)
    }
}

final class IsSandboxArgumentParser: Parser {
    typealias ArgumentType = ()
}
