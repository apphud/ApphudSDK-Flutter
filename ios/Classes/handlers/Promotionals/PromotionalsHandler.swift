//
//  PromotionalsHandler.swift
//  apphud
//
//  Created by Nikolay on 07.10.2021.
//

import Foundation

class PromotionalsHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.Promotionals

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.grantPromotional.rawValue:Action<GrantPromotionalRequest,GrantPromotionalArgumentParser>(args: args, result: result).startFlow()
        default:
            break
        }
    }
}
