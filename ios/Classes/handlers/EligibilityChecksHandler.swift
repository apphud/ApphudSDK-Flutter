//
//  EligibilityChecksHandler.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import Foundation

class EligibilityChecksHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.EligibilityChecks

    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.checkEligibilityForPromotionalOffer.rawValue:
            Action<CheckEligibilityForPromotionalOfferRequest, SingleProductIdParser>(args: args, result: result).startFlow()
        case AssociatedEnum.checkEligibilityForIntroductoryOffer.rawValue:
            Action<CheckEligibilityForIntroductoryOfferRequest, SingleProductIdParser>(args: args, result: result).startFlow()
        case AssociatedEnum.checkEligibilitiesForPromotionalOffers.rawValue:
            Action<CheckEligibilitiesForPromotionalOffersRequest, ProductIdsParser>(args: args, result: result).startFlow()
        case AssociatedEnum.checkEligibilitiesForIntroductoryOffers.rawValue:
            Action<CheckEligibilitiesForIntroductoryOffersRequest, ProductIdsParser>(args: args, result: result).startFlow()
        default:
            break
        }
    }
}
