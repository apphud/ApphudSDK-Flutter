//
//  PermissionGroups.swift
//  apphud
//
//  Created by Nikolay on 11.06.2021.
//

import ApphudSDK
import StoreKit

final class PermissionGroupsRequest: Request {

    typealias ArgumentProvider = PermissionGroupsArgumentParser

    func startRequest(arguments: (), result: @escaping FlutterResult) {
        let groups = Apphud.permissionGroups
        result( groups.map({ group in group.toMap() }) )
    }
}

final class PermissionGroupsArgumentParser: Parser {
    typealias ArgumentType = ()
}
