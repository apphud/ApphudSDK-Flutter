//
//  StartManually.swift
//  appHud
//
//  Created by Stanislav on 08.02.2021.
//

import ApphudSDK

final class StartManuallyRequest: Request {
    typealias ArgumentProvider = StartManuallyArgumentParser

    func startRequest(arguments: (apiKey: String, userID: String?, deviceID: String?, observerMode: Bool), result: @escaping FlutterResult) {
        Apphud.startManually(apiKey: arguments.apiKey,
                             userID: arguments.userID,
                             deviceID: arguments.deviceID,
                             observerMode: arguments.observerMode)
        result(nil)
    }
}

final class StartManuallyArgumentParser: Parser {
    typealias ArgumentType = (apiKey: String, userID: String?, deviceID: String?, observerMode: Bool)
    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let apiKey = args["apiKey"] as? String else {
            throw(InternalError(code: "400", message: "apiKey is required argument"))
        }
        let userID = args["userID"] as? String
        let deviceID = args["deviceID"] as? String
        let observerMode = args["observerMode"] as? Bool

        return (apiKey,
                userID,
                deviceID,
                observerMode ?? false)
    }
}
