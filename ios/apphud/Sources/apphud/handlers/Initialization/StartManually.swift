//
//  StartManually.swift
//  appHud
//
//  Created by Stanislav on 08.02.2021.
//

import ApphudSDK
import Flutter

final class StartManuallyRequest: Request {
    typealias ArgumentProvider = StartManuallyArgumentParser

    @MainActor func startRequest(arguments: (apiKey: String, userID: String?, deviceID: String?, observerMode: Bool, baseUrl: String?, identityVersion: ApphudIdentityVersion), result: @escaping FlutterResult) {
        if let baseUrl = arguments.baseUrl {
            ApphudHttpClient.shared.domainUrlString = baseUrl
        }
        if let user = Apphud.currentUser() {
            result(user.toMap())
            return
        }
        Apphud.startManually(apiKey: arguments.apiKey,
                                 userID: arguments.userID,
                                 deviceID: arguments.deviceID,
                             observerMode: arguments.observerMode,
                             identityVersion: arguments.identityVersion) { (user) in result(user.toMap()) }
        // `Apphud.startManually` resets deeplinkHandler to nil when omitted;
        // restore the Flutter-registered handler.
        ApphudDeeplinkBridge.reapplyHandlerIfNeeded()
    }
}

final class StartManuallyArgumentParser: Parser {
    typealias ArgumentType = (apiKey: String, userID: String?, deviceID: String?, observerMode: Bool, baseUrl: String?, identityVersion: ApphudIdentityVersion)
    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let apiKey = args["apiKey"] as? String else {
            throw(InternalError(code: "400", message: "apiKey is required argument"))
        }
        let userID = args["userID"] as? String
        let deviceID = args["deviceID"] as? String
        let identityVersion = try IdentityVersionArgument.parse(args["identityVersion"])
        if identityVersion == .v2, deviceID != nil {
            throw InternalError(code: "400", message: "deviceID is only supported in V1; V2 uses native SDK IDs")
        }
        let observerMode = args["observerMode"] as? Bool
        let baseUrl = args["baseUrl"] as? String

        return (apiKey,
                userID,
                deviceID,
                observerMode ?? false,
                baseUrl,
                identityVersion)
    }
}
