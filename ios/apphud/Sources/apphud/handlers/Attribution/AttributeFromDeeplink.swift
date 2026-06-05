//
//  AttributeFromDeeplink.swift
//  apphud
//

import ApphudSDK

final class AttributeFromDeeplinkRequest: @MainActor Request {
    typealias ArgumentProvider = AttributeFromDeeplinkArgumentParser

    @MainActor func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.attributeFromDeeplink { data in
            result(data)
        }
    }
}

final class AttributeFromDeeplinkArgumentParser: Parser {
    typealias ArgumentType = ()
}
