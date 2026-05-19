//
//  AttributeFromDeeplink.swift
//  apphud
//

import ApphudSDK

final class AttributeFromDeeplinkRequest: Request {
    typealias ArgumentProvider = AttributeFromDeeplinkArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        Apphud.attributeFromDeeplink { data in
            result(data)
        }
    }
}

final class AttributeFromDeeplinkArgumentParser: Parser {
    typealias ArgumentType = ()
}
