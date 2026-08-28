//
//  PaywallArgumentParser.swift
//  apphud
//
//  Created by Nikolay on 11.06.2021.
//

import ApphudSDK
import StoreKit

final class  PaywallArgumentParser: Parser {
    typealias ArgumentType = (paywallIdentifier:String, placementIdentifier: String?)

    func parse(args: [String : Any]?) throws -> (paywallIdentifier:String, placementIdentifier: String?) {
        guard let args = args, let paywallIdentifier = args["identifier"] as? String else {
            throw(InternalError(code: "400", message: "identifier is required argument"))
        }
        let placementIdentifier = args["placementIdentifier"] as? String
        return (paywallIdentifier, placementIdentifier)
    }
}
