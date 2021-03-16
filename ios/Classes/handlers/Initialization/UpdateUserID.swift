//
//  UpdateUserID.swift
//  appHud
//
//  Created by Stanislav on 08.02.2021.
//

import ApphudSDK

final class UpdateUserIDRequest: Request {
    typealias ArgumentProvider = UpdateUserIDArgumentParser

    func startRequest(arguments: (String), result: @escaping FlutterResult) {
        Apphud.updateUserID(arguments)
        result(nil)
    }
}

final class  UpdateUserIDArgumentParser: Parser {
    typealias ArgumentType = (String)
    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let userID = args["userID"] as? String else {
            throw(InternalError(code: "400", message: "userID is required argument"))
        }
        return userID
    }
}
