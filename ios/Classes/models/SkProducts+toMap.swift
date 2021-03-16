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
        "price": price.description,
        "subscriptionPeriod": subscriptionPeriod?.toMap(),
        "introductoryPrice": introductoryPrice?.toMap(),
        "isDownloadable": isDownloadable,
        "downloadContentLengths": downloadContentLengths.map {$0.intValue},
        "contentVersion": contentVersion,
        "downloadContentVersion": downloadContentVersion
    ]

    if #available(iOS 12.0, *) {
      map["subscriptionGroupIdentifier"] = subscriptionGroupIdentifier
    }

    if #available(iOS 12.2, *) {
        map["discounts"] = discounts.map {$0.toMap()}
    }

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

@available(iOS 11.2, *)
extension SKProductSubscriptionPeriod {
  func toMap() -> [String: Any] {
    return [
      "numberOfUnits": numberOfUnits,
      "unit": unit.rawValue
    ]
  }
}

@available(iOS 11.2, *)
extension SKProductDiscount {
  func toMap() -> [String: Any] {

    return [
        "price": price.description,
        "priceLocale": ["":""],
        "numberOfPeriods": numberOfPeriods,
        "subscriptionPeriod": subscriptionPeriod.toMap(),
        "paymentMode": paymentMode.rawValue,
    ]
  }
}




//@available(iOS 12.2, *)
//open var identifier: String? { get }
//
//
//@available(iOS 11.2, *)
//open var subscriptionPeriod: SKProductSubscriptionPeriod { get }
//
//
//@available(iOS 11.2, *)
//open var numberOfPeriods: Int { get }
//
//
//@available(iOS 11.2, *)
//open var paymentMode: SKProductDiscount.PaymentMode { get }
//
//
//@available(iOS 12.2, *)
//open var type: SKProductDiscount.`Type` { get }
