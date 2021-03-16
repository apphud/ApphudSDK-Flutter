//
//  InitializationHandler.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import ApphudSDK

class InitializationHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.Initialization

    init() {}

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.start.rawValue:
            Action<StartRequest,StartArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.startManually.rawValue:
            Action<StartManuallyRequest,StartManuallyArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.updateUserID.rawValue:
            Action<UpdateUserIDRequest,UpdateUserIDArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.userID.rawValue:
            Action<UserIDRequest,UserIDArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.deviceID.rawValue:
            Action<DeviceIDRequest,DeviceIDArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.logout.rawValue:
            Action<LogoutRequest,LogoutRequestArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.setDelegate.rawValue:
            break
        case AssociatedEnum.setUIDelegate.rawValue:
            // Обсудить, что за UI delegate
            break
        default:
            break
        }
    }
}
