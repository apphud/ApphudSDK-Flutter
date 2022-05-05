//
//  HasPremiumAccess.swift
//  apphud
//
//  Created by Nikolay on 03.05.2022.
//
import ApphudSDK

final class HasPremiumAccessRequest: Request {
    typealias ArgumentProvider = HasPremiumAccessArgumentParser

    func startRequest(arguments: HasPremiumAccessArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        let response = Apphud.hasPremiumAccess()
        result(response)
    }
}

final class HasPremiumAccessArgumentParser: Parser {
    typealias ArgumentType = ()
}
