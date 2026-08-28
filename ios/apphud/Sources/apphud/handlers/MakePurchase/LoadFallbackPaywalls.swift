//
//  LoadFallbackPaywalls.swift
//  apphud
//

import ApphudSDK
import Flutter

final class LoadFallbackPaywallsRequest: @MainActor Request {
    typealias ArgumentProvider = LoadFallbackPaywallsArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.loadFallbackPaywalls { paywalls, error in
            var resultMap: [String: Any?] = [:]
            
            resultMap["paywalls"] = (paywalls?.map { $0.toMap() }) ?? []
            if let error = error {
                resultMap["error"] = error.toApphudErrorMap()
            }
            
             result(resultMap)
        }
    }
}

final class LoadFallbackPaywallsArgumentParser: Parser {
    typealias ArgumentType = ()
}

