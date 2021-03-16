//
//  UserPropertiesHandler.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import Foundation

class UserPropertiesHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.UserProperties

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.setUserProperty.rawValue:
            break
        case AssociatedEnum.incrementUserProperty.rawValue:
            break
        default:
            break
        }
    }
}
