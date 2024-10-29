//
//  AttributeFromWeb.swift
//  apphud
//
//  Created by Nikolay Ivanov on 29.10.2024.
//

import ApphudSDK

final class AttributeFromWebRequest: Request {
    typealias ArgumentProvider = AttributeFromWebArgumentParser
    
    @MainActor func startRequest(arguments: [AnyHashable : Any]?, result: @escaping FlutterResult) {
        if(arguments == nil) {
            result(["wasSuccessful":false])
            return
        }
        Apphud.attributeFromWeb(data: arguments!) { wasSuccessful, user in
            result([
                "wasSuccessful":wasSuccessful,
                "user": user?.toMap()
            ])
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
