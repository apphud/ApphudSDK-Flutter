//
//  SkProducts+toMap.swift
//  appHud
//
//  Created by Stanislav on 10.02.2021.
//

import StoreKit

extension SKProduct {
  func toMap() -> [String: Any?] {
    var map: [String: Any?] = [
        "productIdentifier": productIdentifier,
        "localizedTitle": localizedTitle,
        "localizedDescription": localizedDescription,
        "priceLocale": priceLocale.toMap(),
        "price": price,
        "subscriptionPeriod": subscriptionPeriod?.toMap(),
        "introductoryPrice": introductoryPrice?.toMap(),
        "isDownloadable": isDownloadable,
        "downloadContentLengths": downloadContentLengths.map {$0.intValue},
        "contentVersion": contentVersion,
        "downloadContentVersion": downloadContentVersion,
        "subscriptionGroupIdentifier": subscriptionGroupIdentifier,
        "discounts": discounts.map {$0.toMap()}
    ]

    if #available(iOS 14.0, *) {
      map["isFamilyShareable"] = isFamilyShareable
    }

    return map
  }
}

extension Locale {
  func toMap() -> [String: Any?] {
    return [
        "currencySymbol": currencySymbol ?? "",
        "currencyCode": currencyCode ?? ""
    ]
  }
}

extension SKProductSubscriptionPeriod {
  func toMap() -> [String: Any] {
    return [
      "numberOfUnits": numberOfUnits,
      "unit": unit.rawValue
    ]
  }
}


extension SKProductDiscount {
  func toMap() -> [String: Any] {

    return [
        "price": price,
        "priceLocale": ["":""],
        "numberOfPeriods": numberOfPeriods,
        "subscriptionPeriod": subscriptionPeriod.toMap(),
        "paymentMode": paymentMode.rawValue,
    ]
  }
}
