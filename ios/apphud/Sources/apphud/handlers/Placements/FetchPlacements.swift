//
//  Placements.swift
//  apphud
//
//  Created by Nikolay Ivanov on 28.01.2024.
//

import ApphudSDK
import Flutter
import StoreKit

final class FetchPlacementsRequest: Request {

    typealias ArgumentProvider = FetchPlacementsArgumentParser

    @MainActor func startRequest(arguments: Bool, result: @escaping FlutterResult) {
        Apphud.fetchPlacements(forceRefresh: arguments) { placements, error in
            var resultMap: [String: Any?] = [
                "placements": placements.map({ p in p.toMap() }),
            ]
            if let error = error {
                resultMap["error"] = error.toApphudErrorMap()
            }
            result(resultMap)
        }
    }
}

final class FetchPlacementsArgumentParser: Parser {
    typealias ArgumentType = Bool

    func parse(args: [String : Any]?) throws -> ArgumentType {
        let forceRefresh = args?["forceRefresh"] as? Bool ?? false
        return forceRefresh
    }
}

