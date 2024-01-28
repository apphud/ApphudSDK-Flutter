//
//  Placements.swift
//  apphud
//
//  Created by Nikolay Ivanov on 28.01.2024.
//

import ApphudSDK
import StoreKit

final class PlacementsDidLoadCallbackRequest: Request {

    typealias ArgumentProvider = PlacementsDidLoadCallbackArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.placementsDidLoadCallback({ (placements) in
            result(placements.map({p in p.toMap()}))
        })
    }
}

final class PlacementsDidLoadCallbackArgumentParser: Parser {
    typealias ArgumentType = ()
}

