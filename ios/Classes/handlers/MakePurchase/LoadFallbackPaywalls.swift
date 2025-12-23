//
//  LoadFallbackPaywalls.swift
//  apphud
//

import ApphudSDK

final class LoadFallbackPaywallsRequest: Request {
    typealias ArgumentProvider = LoadFallbackPaywallsArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.loadFallbackPaywalls { paywalls, error in
            var resultMap: [String: Any?] = [:]
            resultMap["paywalls"] = paywalls?.map { $0.toMap() }
            resultMap["error"] = error != nil ? ["message": error!.localizedDescription] : nil
            result(resultMap)
        }
    }
}

final class LoadFallbackPaywallsArgumentParser: Parser {
    typealias ArgumentType = ()
}

