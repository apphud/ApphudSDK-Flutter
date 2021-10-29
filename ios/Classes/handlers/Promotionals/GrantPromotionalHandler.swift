//
//  GrantPromotionalHandler.swift
//  apphud
//
//  Created by Nikolay on 07.10.2021.
//

import ApphudSDK
import StoreKit

final class GrantPromotionalRequest: Request {
    typealias ArgumentProvider = GrantPromotionalArgumentParser

    func startRequest(arguments: ArgumentProvider.ArgumentType, result: @escaping FlutterResult) {
        Apphud.grantPromotional(daysCount: arguments.daysCount, productId: arguments.productId, permissionGroup:arguments.permissionGroup){
            retValue in result(retValue)
        }
    }
}

final class  GrantPromotionalArgumentParser: Parser {
    typealias ArgumentType = (daysCount: Int, productId: String?, permissionGroup: ApphudGroup?)

    func parse(args: [String : Any]?) throws -> (ArgumentType) {
        guard let args = args, let daysCount = args["daysCount"] as? Int else {
            throw(InternalError(code: "400", message: "daysCount is required argument"))
        }
        let productId = args["productId"] as? String
        let permissionGroupName = args["permissionGroupName"] as? String
        let permissionGroup = Apphud.permissionGroups.first { group in
            return group.name == permissionGroupName
        }
        return (daysCount:daysCount, productId:productId, permissionGroup:permissionGroup)
    }
}
