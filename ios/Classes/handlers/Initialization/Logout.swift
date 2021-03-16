//
//  Logout.swift
//  appHud
//
//  Created by Stanislav on 08.02.2021.
//

import ApphudSDK

final class LogoutRequest: Request {
    typealias ArgumentProvider = LogoutRequestArgumentParser

    func startRequest(arguments: LogoutRequestArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Apphud.logout()
        result(nil)
    }
}

final class LogoutRequestArgumentParser: Parser {
    typealias ArgumentType = ()
}
