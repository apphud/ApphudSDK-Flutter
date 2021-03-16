//
//  Start.swift
//  appHud
//
//  Created by Stanislav on 08.02.2021.
//

import ApphudSDK

final class StartRequest: Request {
    typealias ArgumentProvider = StartArgumentParser
    func startRequest(arguments: (apiKey: String, userID: String?, observerMode: Bool), result: @escaping FlutterResult) {
        Apphud.start(apiKey: arguments.apiKey,
                     userID: arguments.userID,
                     observerMode: arguments.observerMode)
        result(nil)
    }
}

final class StartArgumentParser: Parser {

    typealias ArgumentType = (apiKey: String, userID: String?, observerMode: Bool)

    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let apiKey = args["apiKey"] as? String else {
            throw(InternalError(code: "400", message: "apiKey is required argument"))
        }
        let userID = args["userID"] as? String
        let observerMode = args["observerMode"] as? Bool

        return (apiKey,
                userID,
                observerMode ?? false)
    }
}
