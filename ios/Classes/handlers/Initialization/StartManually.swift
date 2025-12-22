//
//  StartManually.swift
//  appHud
//
//  Created by Stanislav on 08.02.2021.
//

import ApphudSDK

final class StartManuallyRequest: Request {
    typealias ArgumentProvider = StartManuallyArgumentParser

    @MainActor func startRequest(arguments: (apiKey: String, userID: String?, deviceID: String?, observerMode: Bool, baseUrl: String?), result: @escaping FlutterResult) {
        Apphud.startManually(apiKey: arguments.apiKey,
                                 userID: arguments.userID,
                                 deviceID: arguments.deviceID,
                             observerMode: arguments.observerMode) { (user) in result(user.toMap()) }
        if let baseUrl = arguments.baseUrl {
            ApphudHttpClient.shared.domainUrlString = baseUrl
        }
    }
}

final class StartManuallyArgumentParser: Parser {
    typealias ArgumentType = (apiKey: String, userID: String?, deviceID: String?, observerMode: Bool, baseUrl: String?)
    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let apiKey = args["apiKey"] as? String else {
            throw(InternalError(code: "400", message: "apiKey is required argument"))
        }
        let userID = args["userID"] as? String
        let deviceID = args["deviceID"] as? String
        let observerMode = args["observerMode"] as? Bool
        let baseUrl = args["baseUrl"] as? String

        return (apiKey,
                userID,
                deviceID,
                observerMode ?? false,
                baseUrl)
    }
}
