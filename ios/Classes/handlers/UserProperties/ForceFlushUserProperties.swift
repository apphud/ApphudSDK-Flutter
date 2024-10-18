//
//  ForceFlushUserProperties.swift
//  apphud
//
//  Created by Nikolay Ivanov on 18.10.2024.
//

import ApphudSDK

final class ForceFlushUserPropertiesRequest: Request {
    typealias ArgumentProvider = ForceFlushUserPropertiesArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.forceFlushUserProperties {value in result(value)}
    }
}

final class ForceFlushUserPropertiesArgumentParser: Parser {
    typealias ArgumentType = ()
}

