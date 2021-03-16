//
//  DeviceID.swift
//  appHud
//
//  Created by Stanislav on 08.02.2021.
//

import ApphudSDK

final class DeviceIDRequest: Request {
    typealias ArgumentProvider = DeviceIDArgumentParser

    func startRequest(arguments: DeviceIDArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        let response = Apphud.deviceID()
        result(response)
    }
}

final class DeviceIDArgumentParser: Parser {
    typealias ArgumentType = ()
}
