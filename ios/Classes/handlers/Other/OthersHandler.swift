//
//  OthersHandler.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import Foundation

class OthersHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.Others

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.enableDebugLogs.rawValue:
            Action<EnableDebugLogsRequest,EnableDebugLogsArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.isSandbox.rawValue:
            Action<IsSandboxRequest,IsSandboxArgumentParser>(args: args, result: result).startFlow()
        default:
            break
        }
    }
}
