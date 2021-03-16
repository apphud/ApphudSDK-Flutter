//
//  SetAdvertisingIdentifier.swift
//  appHud
//
//  Created by Stanislav on 23.02.2021.
//

import ApphudSDK

final class SetAdvertisingIdentifierRequest: Request {
    typealias ArgumentProvider = SetAdvertisingIdentifierArgumentParser

    func startRequest(arguments: (String), result: @escaping FlutterResult) {
        Apphud.setAdvertisingIdentifier(arguments)
        result(nil)
    }
}

final class SetAdvertisingIdentifierArgumentParser: Parser {
    typealias ArgumentType = (String)

    func parse(args: [String : Any]?) throws -> (String) {
        guard let args = args, let idfa = args["idfa"] as? String else {
            throw(InternalError(code: "400", message: "idfa is required argument"))
        }
        
        return idfa
    }
}
