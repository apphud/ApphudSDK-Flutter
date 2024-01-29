//
//  Placements.swift
//  apphud
//
//  Created by Nikolay Ivanov on 28.01.2024.
//

import ApphudSDK
import StoreKit

final class PlacementsRequest: Request {

    typealias ArgumentProvider = PlacementsArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Task { @MainActor in
            let placements = await Apphud.placements()
            result(placements.map({p in p.toMap()}))
        }
    }
}

final class PlacementsArgumentParser: Parser {
    typealias ArgumentType = ()
}

