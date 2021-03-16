//
//  Subscription.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import ApphudSDK

final class SubscriptionRequest: Request {
    typealias ArgumentProvider = SubscriptionArgumentParser

    func startRequest(arguments: SubscriptionArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        let response = Apphud.subscription()
        result(response?.toMap())
    }
}

final class SubscriptionArgumentParser: Parser {
    typealias ArgumentType = ()
}
