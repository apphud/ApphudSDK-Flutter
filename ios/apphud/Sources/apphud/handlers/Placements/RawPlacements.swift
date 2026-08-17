//
//  Placements.swift
//  apphud
//
//  Created by Nikolay Ivanov on 28.01.2024.
//

import ApphudSDK
import StoreKit

final class RawPlacementsRequest: Request {

    typealias ArgumentProvider = RawPlacementsArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        let placements = Apphud.rawPlacements()
        result(placements.map({p in p.toMap()}))
    }
}

final class RawPlacementsArgumentParser: Parser {
    typealias ArgumentType = ()
}

