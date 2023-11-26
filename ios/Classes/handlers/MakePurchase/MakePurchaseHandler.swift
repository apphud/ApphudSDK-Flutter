//
//  MakePurchaseHandler.swift
//  appHud
//
//  Created by Stanislav on 05.02.2021.
//

import ApphudSDK

class MakePurchaseHandler: Handler {
    typealias AssociatedEnum = AppHudMethod.MakePurchase
    
    func tryToHandle(method: String, args: [String : Any]?, result: @escaping FlutterResult) {
        switch method {
        case AssociatedEnum.products.rawValue:
            Action<ProductsRequest,ProductsArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.product.rawValue:
            Action<ProductRequest,ProductArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.purchase.rawValue:
            Action<PurchaseRequest,PurchaseArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.purchasePromo.rawValue:
            Action<PurchasePromoRequest,PurchasePromoArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.presentOfferCodeRedemptionSheet.rawValue:
            Action<PresentOfferCodeRedemptionSheetRequest,PresentOfferCodeRedemptionSheetArgumentParser>(args: args, result: result).startFlow()
        case AssociatedEnum.purchaseProduct.rawValue:
            Action<PurchaseProductRequest,PurchaseProductArgumentParser>(args: args, result: result).startFlow()
        default:
            break
        }
    }
}
