//
//  Placements.swift
//  apphud
//
//  Created by Nikolay Ivanov on 28.01.2024.
//

import ApphudSDK
import StoreKit

final class FetchPlacementsRequest: Request {

    typealias ArgumentProvider = FetchPlacementsArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.placementsDidLoadCallback({ (placements) in
            result([
                "placements": placements.map({p in p.toMap()})
            ])
        })
    }
}

final class FetchPlacementsArgumentParser: Parser {
    typealias ArgumentType = ()
}

