//
//  DisableIDFACollection.swift
//  appHud
//
//  Created by Stanislav on 23.02.2021.
//

import ApphudSDK

final class DisableIDFACollectionRequest: Request {
    typealias ArgumentProvider = DisableIDFACollectionArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.disableIDFACollection()
        result(nil)
    }
}

final class DisableIDFACollectionArgumentParser: Parser {
    typealias ArgumentType = ()
}
