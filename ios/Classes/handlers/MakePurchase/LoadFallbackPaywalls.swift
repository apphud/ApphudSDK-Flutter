//
//  LoadFallbackPaywalls.swift
//  apphud
//

import ApphudSDK

final class LoadFallbackPaywallsRequest: @MainActor Request {
    typealias ArgumentProvider = LoadFallbackPaywallsArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.loadFallbackPaywalls { paywalls, error in
            var resultMap: [String: Any?] = [:]
            
            resultMap["paywalls"] = (paywalls?.map { $0.toMap() }) ?? []
            if error != nil {
                resultMap["error"] = ["message": error!.localizedDescription]
               
            }
            
             result(resultMap)
        }
    }
}

final class LoadFallbackPaywallsArgumentParser: Parser {
    typealias ArgumentType = ()
}

