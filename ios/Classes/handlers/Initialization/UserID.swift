//
//  UserID.swift
//  appHud
//
//  Created by Stanislav on 08.02.2021.
//

import ApphudSDK

final class UserIDRequest: Request {

    typealias ArgumentProvider = UserIDArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        let response = Apphud.userID()
        result(response)
    }
}

final class  UserIDArgumentParser: Parser {
    typealias ArgumentType = ()
}
