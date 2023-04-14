//
//  SubmitPushNotificationsToken.swift
//  apphud
//
//  Created by Nikolay on 12.04.2023.
//
import ApphudSDK

final class SubmitPushNotificationsTokenRequest: Request {
    typealias ArgumentProvider = SubmitPushNotificationsTokenArgumentParser
    
    func startRequest(arguments: (Data), result: @escaping FlutterResult) {
        
        Apphud.submitPushNotificationsToken(token: arguments) {(sendResult) in
            result(sendResult)
        }
    }
}

final class SubmitPushNotificationsTokenArgumentParser: Parser {
    typealias ArgumentType = (Data)
    
    func parse(args: [String : Any]?) throws -> (Data) {
        guard let args = args, let token = args["token"] as? String else {
            throw(InternalError(code: "400", message: "token is required argument"))
        }
        
        return Data(token.utf8)
    }
}
