//
//  PaywallArgumentParser.swift
//  apphud
//
//  Created by Nikolay on 11.06.2021.
//

import ApphudSDK
import StoreKit

final class  PaywallArgumentParser: Parser {
    typealias ArgumentType = (String)

    func parse(args: [String : Any]?) throws -> (String) {
        guard let args = args, let identifier = args["identifier"] as? String else {
            throw(InternalError(code: "400", message: "identifier is required argument"))
        }
        return identifier
    }
}
