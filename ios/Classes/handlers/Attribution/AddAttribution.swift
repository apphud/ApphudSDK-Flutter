//
//  AddAttribution.swift
//  appHud
//
//  Created by Stanislav on 23.02.2021.
//

import ApphudSDK

final class AddAttributionRequest: Request {
    typealias ArgumentProvider = AddAttributionArgumentParser

    func startRequest(arguments: (data: [AnyHashable : Any], from: ApphudAttributionProvider, identifer: String?), result: @escaping FlutterResult) {
        Apphud.addAttribution(data: arguments.data, from: arguments.from, identifer: arguments.identifer) { (isAdded) in
            result(isAdded)
        }
    }
}

final class AddAttributionArgumentParser: Parser {
    typealias ArgumentType = (data: [AnyHashable : Any], from: ApphudAttributionProvider, identifer: String?)

    func parse(args: [String : Any]?) throws -> (data: [AnyHashable : Any], from: ApphudAttributionProvider, identifer: String?) {
        guard let args = args,
              let data = args["data"] as? [AnyHashable : Any],
              let fromString = args["from"] as? String,
              let from = ApphudAttributionProvider.fromString(fromString) else {
            throw(InternalError(code: "400", message: "data and attibution provider are required arguments"))
        }
        let identifer = args["identifer"] as? String
        return (data,
                from,
                identifer)
    }
}

extension ApphudAttributionProvider {

    static func fromString(_ string: String) -> ApphudAttributionProvider? {
        switch string {
        case "appsFlyer":
            return ApphudAttributionProvider.appsFlyer
        case "adjust":
            return ApphudAttributionProvider.adjust
        case "facebook":
            return ApphudAttributionProvider.facebook
        case "appleSearchAds":
            return ApphudAttributionProvider.appleSearchAds
        case "appleAdsAttribution":
            return ApphudAttributionProvider.appleAdsAttribution
        case "firebase":
            return ApphudAttributionProvider.firebase
        default:
            return nil
        }
    }
}
