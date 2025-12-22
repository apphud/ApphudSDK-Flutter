//
//  AddAttribution.swift
//  appHud
//
//  Created by Stanislav on 23.02.2021.
//

import ApphudSDK

final class AddAttributionRequest: Request {
    typealias ArgumentProvider = AddAttributionArgumentParser

    func startRequest(arguments: (data: ApphudAttributionData, from: ApphudAttributionProvider, identifer: String?), result: @escaping FlutterResult) {
        Apphud.setAttribution(data: arguments.data, from: arguments.from, identifer: arguments.identifer) { (isAdded, _) in
            result(isAdded)
        }
    }
}

final class AddAttributionArgumentParser: Parser {
    typealias ArgumentType = (data: ApphudAttributionData, from: ApphudAttributionProvider, identifer: String?)

    func parse(args: [String : Any]?) throws -> (data: ApphudAttributionData, from: ApphudAttributionProvider, identifer: String?) {
        guard let args = args,
              let fromString = args["from"] as? String,
              let from = ApphudAttributionProvider.fromString(fromString) else {
                  throw(InternalError(code: "400", message: "attibution provider is required argument"))
                 }
        guard let dataMap = args["data"] as? [AnyHashable : Any] else {
                 throw(InternalError(code: "400", message: "data is required argument"))
                 }
        let identifier = args["identifier"] as? String
        guard let rawData = dataMap["rawData"] as? [AnyHashable : Any] else {
            throw(InternalError(code: "400", message: "rawData is required argument"))
            }
        let adNetwork = dataMap["adNetwork"] as? String
        let channel = dataMap["channel"] as? String
        let campaign = dataMap["campaign"] as? String
        let adSet = dataMap["adSet"] as? String
        let creative = dataMap["creative"] as? String
        let keyword = dataMap["keyword"] as? String
        let custom1 = dataMap["custom1"] as? String
        let custom2 = dataMap["custom2"] as? String
      
        let data = ApphudAttributionData(rawData: rawData,
                                         adNetwork: adNetwork,
                                         channel: channel,
                                         campaign: campaign,
                                         adSet: adSet,
                                         creative: creative,
                                         keyword: keyword,
                                         custom1: custom1,
                                         custom2: custom2)
        
        return (data,
                from,
                identifier)
    }
}

extension ApphudAttributionProvider {

    static func fromString(_ string: String) -> ApphudAttributionProvider? {
        switch string {
        case "appsFlyer":
            return ApphudAttributionProvider.appsFlyer
        case "adjust":
            return ApphudAttributionProvider.adjust
        case "appleAdsAttribution":
            return ApphudAttributionProvider.appleAdsAttribution
        case "firebase":
            return ApphudAttributionProvider.firebase
        case "custom":
            return ApphudAttributionProvider.custom
        case "facebook":
            return ApphudAttributionProvider.facebook
        default:
            return nil
        }
    }
}
