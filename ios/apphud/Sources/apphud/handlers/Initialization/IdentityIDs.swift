import ApphudSDK
import Flutter

final class IdentityIDArgumentParser: Parser {
    typealias ArgumentType = ()
}

final class InstallationIDRequest: Request {
    typealias ArgumentProvider = IdentityIDArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        let id = Apphud.installationID()
        result(id.isEmpty ? nil : id)
    }
}

final class AnonymousIDRequest: Request {
    typealias ArgumentProvider = IdentityIDArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        let id = Apphud.anonymousID()
        result(id.isEmpty ? nil : id)
    }
}
