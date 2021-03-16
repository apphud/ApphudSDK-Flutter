//
//  DidFetchProductsNotification.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import Foundation
import ApphudSDK

final class DidFetchProductsNotificationRequest: Request {

    typealias ArgumentProvider = DidFetchProductsNotificationArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        let name = Apphud.didFetchProductsNotification()
        result(name.rawValue)
    }
}

final class DidFetchProductsNotificationArgumentParser: Parser {
    typealias ArgumentType = ()
}
