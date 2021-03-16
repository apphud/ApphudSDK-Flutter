//
//  RulesAndScreensMethodsHandler.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import Foundation

class RulesAndScreensMethodsHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.RulesAndScreensMethods

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.showPendingScreen.rawValue:
            break
        case AssociatedEnum.pendingScreenController.rawValue:
            break
        case AssociatedEnum.pendingRule.rawValue:
            break
        default:
            break
        }
    }
}
