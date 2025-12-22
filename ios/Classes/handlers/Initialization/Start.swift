//
//  Start.swift
//  appHud
//
//  Created by Stanislav on 08.02.2021.
//

import ApphudSDK
#if canImport(UIKit)
import UIKit
#endif

final class StartRequest: Request {
    typealias ArgumentProvider = StartArgumentParser
    @MainActor func startRequest(arguments: (apiKey: String, userID: String?, observerMode: Bool, baseUrl: String?), result: @escaping FlutterResult) {
        Apphud.start(apiKey: arguments.apiKey,
                               userID: arguments.userID,
                               observerMode: arguments.observerMode) { (user) in result(user.toMap()) }
        if let baseUrl = arguments.baseUrl {
            ApphudHttpClient.shared.domainUrlString = baseUrl
        }
#if os(iOS)
        Apphud.setDeviceIdentifiers(idfa: nil, idfv: UIDevice.current.identifierForVendor?.uuidString)
#endif
    }
}

final class StartArgumentParser: Parser {

    typealias ArgumentType = (apiKey: String, userID: String?, observerMode: Bool, baseUrl: String?)

    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let apiKey = args["apiKey"] as? String else {
            throw(InternalError(code: "400", message: "apiKey is required argument"))
        }
        let userID = args["userID"] as? String
        let observerMode = args["observerMode"] as? Bool
        let baseUrl = args["baseUrl"] as? String

        return (apiKey,
                userID,
                observerMode ?? false,
                baseUrl)
    }
}
