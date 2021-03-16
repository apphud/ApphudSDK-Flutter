//
//  PushNotificationsHandlers.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import Foundation

class PushNotificationsHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.PushNotifications

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.submitPushNotificationsToken.rawValue:
            break
        case AssociatedEnum.handlePushNotification.rawValue:
            break
        default:
            break
        }
    }
}
