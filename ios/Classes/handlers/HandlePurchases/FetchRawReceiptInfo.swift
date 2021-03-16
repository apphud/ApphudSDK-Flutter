//
//  FetchRawReceiptInfo.swift
//  appHud
//
//  Created by Stanislav on 17.02.2021.
//

import ApphudSDK

final class FetchRawReceiptInfoRequest: Request {
    typealias ArgumentProvider = FetchRawReceiptInfoArgumentParser

    func startRequest(arguments: FetchRawReceiptInfoArgumentParser.ArgumentType, result: @escaping FlutterResult) {
        Apphud.fetchRawReceiptInfo { (reciept) in
            result(reciept?.rawJSON)
        }
    }
}

final class FetchRawReceiptInfoArgumentParser: Parser {
    typealias ArgumentType = ()
}
