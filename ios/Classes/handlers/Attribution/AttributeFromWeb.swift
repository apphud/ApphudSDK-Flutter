//
//  AttributeFromWeb.swift
//  apphud
//
//  Created by Nikolay Ivanov on 29.10.2024.
//

import ApphudSDK

final class AttributeFromWebRequest: @MainActor Request {
    typealias ArgumentProvider = AttributeFromWebArgumentParser
    
    @MainActor func startRequest(arguments: [AnyHashable : Any]?, result: @escaping FlutterResult) {
        if(arguments == nil) {
            result(["wasSuccessful":false])
            return
        }
        Apphud.attributeFromWeb(data: arguments!) { wasSuccessful, user in
            var dict: [String: Any] = ["wasSuccessful": wasSuccessful]
            if let user {
                dict["user"] = user.toMap()
            }
            
            result(dict)
        }
    }
}

final class AttributeFromWebArgumentParser: Parser {
    typealias ArgumentType = [AnyHashable : Any]?

    func parse(args: [String : Any]?) throws -> [AnyHashable : Any]?{
        let data = args as? [AnyHashable : Any]
        return data
    }
}
