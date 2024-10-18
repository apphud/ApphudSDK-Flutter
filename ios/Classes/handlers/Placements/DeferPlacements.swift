//
//  DeferPlacements.swift
//  apphud
//
//  Created by Nikolay Ivanov on 18.10.2024.
//

import ApphudSDK

final class DeferPlacementsRequest: Request {

    typealias ArgumentProvider = DeferPlacementsArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.deferPlacements()
        result(nil)
    }
}

final class DeferPlacementsArgumentParser: Parser {
    typealias ArgumentType = ()
}
