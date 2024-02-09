//
//  Placement.swift
//  apphud
//
//  Created by Nikolay Ivanov on 28.01.2024.
//


import ApphudSDK

final class PlacementRequest: Request {
    typealias ArgumentProvider = PlacementArgumentParser

    func startRequest(arguments: (String), result: @escaping FlutterResult) {
        Task{@MainActor in
            let placement = await Apphud.placement(arguments)
            result(placement?.toMap())
        }
    }
}

final class  PlacementArgumentParser: Parser {
    typealias ArgumentType = (String)
    func parse(args: [String : Any]?) throws -> ArgumentType {
        guard let args = args, let identifier = args["identifier"] as? String else {
            throw(InternalError(code: "400", message: "identifier is required argument"))
        }
        return (identifier)
    }
}

