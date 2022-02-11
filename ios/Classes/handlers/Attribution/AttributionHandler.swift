//
//  AttributionHandler.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import Foundation

class AttributionHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.Attribution

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.setAdvertisingIdentifier.rawValue:
            Action<SetAdvertisingIdentifierRequest,SetAdvertisingIdentifierArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.addAttribution.rawValue:
            Action<AddAttributionRequest,AddAttributionArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.collectSearchAdsAttribution.rawValue:
            Action<CollectSearchAdsAttributionRequest,CollectSearchAdsAttributionParser>(args: args, result: result).startFlow()
        default:
            break
        }
    }
}
