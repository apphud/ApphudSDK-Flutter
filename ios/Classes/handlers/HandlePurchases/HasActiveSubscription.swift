//
//  HasActiveSubscription.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import ApphudSDK

final class HasActiveSubscriptionRequest: Request {
    typealias ArgumentProvider = HasActiveSubscriptionArgumentParser

    func startRequest(arguments: DeviceIDArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        let response = Apphud.hasActiveSubscription()
        result(response)
    }
}

final class HasActiveSubscriptionArgumentParser: Parser {
    typealias ArgumentType = ()
}
