package com.apphud.fluttersdk.handlers

import android.app.Activity
import com.apphud.sdk.Apphud
import io.flutter.plugin.common.MethodChannel


class MakePurchaseHandler(override val routes: List<String>, val activity: Activity) : Handler {

    override fun tryToHandle(method: String, args: Map<String, Any>?, result: MethodChannel.Result) {
        when (method) {
            MakePurchaseRoutes.didFetchProductsNotification.name -> result.notImplemented()
            MakePurchaseRoutes.productsDidFetchCallback.name -> productsDidFetchCallback(result)
            MakePurchaseRoutes.refreshStoreKitProducts.name -> result.notImplemented()
            MakePurchaseRoutes.products.name -> products(result)
            MakePurchaseRoutes.product.name -> ProductParser(result).parse(args) { productIdentifier ->
                product(productIdentifier, result)
            }
            MakePurchaseRoutes.purchase.name -> PurchaseParser(result).parse(args) { productId ->
                purchase(productId, result)
            }
            MakePurchaseRoutes.purchaseWithoutValidation.name -> result.notImplemented()
            MakePurchaseRoutes.purchasePromo.name -> result.notImplemented()
            MakePurchaseRoutes.syncPurchases.name -> syncPurchases(result)
            MakePurchaseRoutes.presentOfferCodeRedemptionSheet.name -> result.notImplemented()
        }
    }

    private fun didFetchProductsNotification(result: MethodChannel.Result) {
        // not implemented
    }

    private fun productsDidFetchCallback(result: MethodChannel.Result) {
        Apphud.productsFetchCallback { skuProducts ->

            val jsonList: List<HashMap<String, Any?>> = skuProducts.map {
                hashMapOf(
                        "description" to it.description,
                        "freeTrialPeriod" to it.freeTrialPeriod,
                        "introductoryPrice" to it.introductoryPrice,
                        "introductoryPriceAmountMicros" to it.introductoryPriceAmountMicros,
                        "introductoryPriceCycles" to it.introductoryPriceCycles,
                        "introductoryPricePeriod" to it.introductoryPricePeriod,
                        "price" to it.price,
                        "priceAmountMicros" to it.priceAmountMicros,
                        "priceCurrencyCode" to it.priceCurrencyCode,
                        "sku" to it.sku,
                        "subscriptionPeriod" to it.subscriptionPeriod,
                        "title" to it.title,
                        "type" to it.type,
                        "originalPrice" to it.originalPrice,
                        "originalPriceAmountMicros" to it.originalPriceAmountMicros
                )
            }
            result.success(jsonList)

        }
    }

    private fun products(result: MethodChannel.Result) {
        val skuProducts = Apphud.products()
        if (skuProducts != null) {
            val jsonList: List<HashMap<String, Any?>> = skuProducts.map {
                hashMapOf(
                        "description" to it.description,
                        "freeTrialPeriod" to it.freeTrialPeriod,
                        "introductoryPrice" to it.introductoryPrice,
                        "introductoryPriceAmountMicros" to it.introductoryPriceAmountMicros,
                        "introductoryPriceCycles" to it.introductoryPriceCycles,
                        "introductoryPricePeriod" to it.introductoryPricePeriod,
                        "price" to it.price,
                        "priceAmountMicros" to it.priceAmountMicros,
                        "priceCurrencyCode" to it.priceCurrencyCode,
                        "sku" to it.sku,
                        "subscriptionPeriod" to it.subscriptionPeriod,
                        "title" to it.title,
                        "type" to it.type,
                        "originalPrice" to it.originalPrice,
                        "originalPriceAmountMicros" to it.originalPriceAmountMicros
                )
            }
            result.success(jsonList)
        } else {
            result.success(null)
        }
    }

    private fun product(productIdentifier: String, result: MethodChannel.Result) {
        val skuProduct = Apphud.product(productIdentifier = productIdentifier)

        if (skuProduct != null) {
            val dict = hashMapOf(
                    "description" to skuProduct.description,
                    "freeTrialPeriod" to skuProduct.freeTrialPeriod,
                    "introductoryPrice" to skuProduct.introductoryPrice,
                    "introductoryPriceAmountMicros" to skuProduct.introductoryPriceAmountMicros,
                    "introductoryPriceCycles" to skuProduct.introductoryPriceCycles,
                    "introductoryPricePeriod" to skuProduct.introductoryPricePeriod,
                    "price" to skuProduct.price,
                    "priceAmountMicros" to skuProduct.priceAmountMicros,
                    "priceCurrencyCode" to skuProduct.priceCurrencyCode,
                    "sku" to skuProduct.sku,
                    "subscriptionPeriod" to skuProduct.subscriptionPeriod,
                    "title" to skuProduct.title,
                    "type" to skuProduct.type,
                    "originalPrice" to skuProduct.originalPrice,
                    "originalPriceAmountMicros" to skuProduct.originalPriceAmountMicros
            )
            result.success(dict)
        } else {
            result.success(null)
        }
    }

    private fun purchase(productId: String, result: MethodChannel.Result) {
        Apphud.purchase(activity, productId) { purchases ->
            val jsonList: List<HashMap<String, Any?>> = purchases.map {
                hashMapOf(
                        "orderId" to it.orderId,
                        "originalJson" to it.originalJson,
                        "packageName" to it.packageName,
                        "purchaseState" to it.purchaseState,
                        "purchaseTime" to it.purchaseTime,
                        "purchaseToken" to it.purchaseToken,
                        "signature" to it.signature,
                        "sku" to it.sku
                )
            }
            result.success(jsonList)
        }
    }

    private fun purchaseWithoutValidation() {
        // not implemented
    }

    private fun purchasePromo() {
        // not implemented
    }

    private fun syncPurchases(result: MethodChannel.Result) {
        Apphud.syncPurchases()
        result.success(null)
    }

    class ProductParser(val result: MethodChannel.Result) {
        fun parse(args: Map<String, Any>?, callback: (productIdentifier: String) -> Unit) {
            try {
                args ?: throw IllegalArgumentException("productIdentifier is required argument")
                val productIdentifier = args["productIdentifier"] as? String
                        ?: throw IllegalArgumentException("productIdentifier is required argument")

                callback(productIdentifier)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }

    class PurchaseParser(val result: MethodChannel.Result) {
        fun parse(args: Map<String, Any>?, callback: (productId: String) -> Unit) {
            try {
                args ?: throw IllegalArgumentException("productId is required argument")
                val productId = args["productId"] as? String
                        ?: throw IllegalArgumentException("productId is required argument")

                callback(productId)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }
}

enum class MakePurchaseRoutes {
    didFetchProductsNotification,
    productsDidFetchCallback,
    refreshStoreKitProducts,
    products,
    product,
    purchase,
    purchaseWithoutValidation,
    purchasePromo,
    syncPurchases,
    presentOfferCodeRedemptionSheet;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
