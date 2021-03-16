//
//  NonRenewingPurchases.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import ApphudSDK

final class NonRenewingPurchasesRequest: Request {
    typealias ArgumentProvider = NonRenewingPurchasesArgumentParser

    func startRequest(arguments: NonRenewingPurchasesArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        let response = Apphud.nonRenewingPurchases()
        result(response?.map {anrp in anrp.toMap()})
    }
}

final class NonRenewingPurchasesArgumentParser: Parser {
    typealias ArgumentType = ()
}
