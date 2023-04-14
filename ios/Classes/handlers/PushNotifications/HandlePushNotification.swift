//
//  HandlePushNotification.swift
//  apphud
//
//  Created by Nikolay on 13.04.2023.
//

import Foundation

import ApphudSDK

final class HandlePushNotificationRequest: Request {
    typealias ArgumentProvider = HandlePushNotificationArgumentParser
    
    func startRequest(arguments: ([AnyHashable : Any]), result: @escaping FlutterResult) {
        let handleResult = Apphud.handlePushNotification(apsInfo: arguments)
        result(handleResult)
    }
}

final class HandlePushNotificationArgumentParser: Parser {
    typealias ArgumentType = ([AnyHashable : Any])
    
    func parse(args: [String : Any]?) throws -> ([AnyHashable : Any]) {
        guard let args = args else {
            throw(InternalError(code: "400", message: "there are no arguments"))
        }
                
        return args
    }
}
