//
//  IsNonRenewingPurchaseConsumable.swift
//  appHud
//
//  Created by ren6 on 23.12.2024.
//

import ApphudSDK

final class IsNonRenewingPurchaseConsumableRequest: Request {
    typealias ArgumentProvider = IsNonRenewingPurchaseConsumableArgumentParser

    @MainActor func startRequest(arguments: (String), result: @escaping FlutterResult) {
        let productId = arguments
        
        guard let purchase = Apphud.nonRenewingPurchases()?.first(where: { $0.productId == productId }) else {
            result(nil)
            return
        }
        
        if #available(iOS 15.0, *) {
            Task {
                let isConsumable = await purchase.isConsumablePurchase()
                result(isConsumable)
            }
        } else {
            result(nil)
        }
    }
}

final class IsNonRenewingPurchaseConsumableArgumentParser: Parser {
    typealias ArgumentType = (String)

    func parse(args: [String : Any]?) throws -> (String) {
        guard let args = args, let productId = args["productId"] as? String else {
            throw(InternalError(code: "400", message: "productId is required argument"))
        }
        return productId
    }
}

