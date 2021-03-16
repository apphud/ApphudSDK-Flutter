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
            break
        case AssociatedEnum.checkEligibilityForIntroductoryOffer.rawValue:
            break
        case AssociatedEnum.checkEligibilitiesForPromotionalOffers.rawValue:
            break
        case AssociatedEnum.checkEligibilitiesForIntroductoryOffers.rawValue:
            break
        default:
            break
        }
    }
}
