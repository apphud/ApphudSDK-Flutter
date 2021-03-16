//
//  Subscriptions.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import ApphudSDK

final class SubscriptionsRequest: Request {
    typealias ArgumentProvider = SubscriptionsArgumentParser

    func startRequest(arguments: SubscriptionsArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        let response = Apphud.subscriptions()
        result(response?.map{ sub in sub.toMap()})
    }
}

final class SubscriptionsArgumentParser: Parser {
    typealias ArgumentType = ()
}
