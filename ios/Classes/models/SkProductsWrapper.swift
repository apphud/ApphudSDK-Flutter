//
//  SkProductsWrapper.swift
//  appHud
//
//  Created by Stanislav on 10.02.2021.
//

import StoreKit

// FROZEN
class SKProductWrapper: SKProduct {
    @available(iOS 3.0, *)
    override var localizedDescription: String { return internalLocalizedDescription }

    @available(iOS 3.0, *)
    override var localizedTitle: String { return internalLocalizedTitle }


    @available(iOS 3.0, *)
    override var price: NSDecimalNumber { return internalPrice }


    @available(iOS 3.0, *)
    override var priceLocale: Locale { return internalPriceLocale }


    @available(iOS 3.0, *)
    override var productIdentifier: String { return internalProductIdentifier }


    // YES if this product has content downloadable using SKDownload
    @available(iOS 6.0, *)
    override var isDownloadable: Bool { return internalIsDownloadable }


    // YES if this product allows for sharing among family members
    @available(iOS 14.0, *)
    override var isFamilyShareable: Bool { return internalIsFamilyShareable }


    @available(iOS 6.0, *)
    override var downloadContentLengths: [NSNumber] { return internalDownloadContentLengths }

    // Version of the downloadable content
    override var contentVersion: String { return internalContentVersion }

    @available(iOS 6.0, *)
    override var downloadContentVersion: String { return internalDownloadContentVersion }


    @available(iOS 11.2, *)
    override var subscriptionPeriod: SKProductSubscriptionPeriod? { return internalSubscriptionPeriod }


    @available(iOS 11.2, *)
    override var introductoryPrice: SKProductDiscount? { return internalIntroductoryPrice }


    @available(iOS 12.0, *)
    override var subscriptionGroupIdentifier: String? { return internalSubscriptionGroupIdentifier }


    @available(iOS 12.2, *)
    override var discounts: [SKProductDiscount] { return internalDiscounts }

    private let internalLocalizedDescription: String
    private let internalLocalizedTitle: String
    private let internalPrice: NSDecimalNumber
    private let internalPriceLocale: Locale
    private let internalProductIdentifier: String
    private let internalIsDownloadable: Bool
    private let internalIsFamilyShareable: Bool
    private let internalDownloadContentLengths: [NSNumber]
    private let internalContentVersion: String
    private let internalDownloadContentVersion: String
    private let internalSubscriptionPeriod: SKProductSubscriptionPeriod?
    private let internalIntroductoryPrice: SKProductDiscount?
    private let internalSubscriptionGroupIdentifier: String?
    private let internalDiscounts: [SKProductDiscount]

    init(skProduct: SKProduct) {
        self.internalLocalizedDescription = skProduct.localizedDescription
        self.internalLocalizedTitle = skProduct.localizedTitle
        self.internalPrice = skProduct.price
        self.internalPriceLocale = skProduct.priceLocale
        self.internalProductIdentifier = skProduct.productIdentifier
        self.internalIsDownloadable = skProduct.isDownloadable
        if #available(iOS 14.0, *) {
            self.internalIsFamilyShareable = skProduct.isFamilyShareable
        } else {
            self.internalIsFamilyShareable = false
        }
        self.internalDownloadContentLengths = skProduct.downloadContentLengths
        self.internalContentVersion = skProduct.contentVersion
        self.internalDownloadContentVersion = skProduct.downloadContentVersion
        self.internalSubscriptionPeriod = skProduct.subscriptionPeriod
        self.internalIntroductoryPrice = skProduct.introductoryPrice
        if #available(iOS 12.0, *) {
            self.internalSubscriptionGroupIdentifier = skProduct.subscriptionGroupIdentifier
        } else {
            self.internalSubscriptionGroupIdentifier = nil
        }
        if #available(iOS 12.2, *) {
            self.internalDiscounts = skProduct.discounts
        } else {
            self.internalDiscounts = []
        }
   }
}
