//
//  PlacementsHandler.swift
//  apphud
//
//  Created by Nikolay Ivanov on 28.01.2024.
//

class PlacementsHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.Placements

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.placements.rawValue:
            Action<PlacementsRequest,PlacementsArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.placement.rawValue:
            Action<PlacementRequest,PlacementArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.rawPlacements.rawValue:
            Action<RawPlacementsRequest,RawPlacementsArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.fetchPlacements.rawValue:
            Action<FetchPlacementsRequest,FetchPlacementsArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.deferPlacements.rawValue:
            Action<DeferPlacementsRequest,DeferPlacementsArgumentParser>(args: args, result: result).startFlow()
        default:
            break
        }
    }
}

