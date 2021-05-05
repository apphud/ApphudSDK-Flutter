package com.apphud.fluttersdk.handlers

import com.apphud.sdk.domain.ApphudSubscription
import com.apphud.sdk.domain.ApphudNonRenewingPurchase
import com.android.billingclient.api.Purchase
import com.android.billingclient.api.SkuDetails

class DataTransformer {
    companion object {
        @kotlin.jvm.JvmStatic
        fun subscription(subscription: ApphudSubscription): HashMap<String, Any?> {
            return hashMapOf(
                    "productId" to subscription.productId,
                    "expiresAt" to subscription.expiresAt,
                    "startedAt" to subscription.startedAt,
                    "canceledAt" to subscription.cancelledAt,
                    "isInRetryBilling" to subscription.isInRetryBilling,
                    "isAutorenewEnabled" to subscription.isAutoRenewEnabled,
                    "isIntroductoryActivated" to subscription.isIntroductoryActivated,
                    "isActive" to subscription.isActive(),
                    "status" to subscription.status.name.toLowerCase())
        }

        @kotlin.jvm.JvmStatic
        fun nonRenewingPurchase(purchase: ApphudNonRenewingPurchase): HashMap<String, Any?> {
            return hashMapOf(
                    "productId" to purchase.productId,
                    "purchasedAt" to purchase.purchasedAt,
                    "canceledAt" to purchase.canceledAt,
                    "isActive" to purchase.isActive())
        }

        @kotlin.jvm.JvmStatic
        fun purchase(purchase: Purchase): HashMap<String, Any?> {
            return hashMapOf(
                    "orderId" to purchase.orderId,
                    "originalJson" to purchase.originalJson,
                    "packageName" to purchase.packageName,
                    "purchaseState" to purchase.purchaseState,
                    "purchaseTime" to purchase.purchaseTime,
                    "purchaseToken" to purchase.purchaseToken,
                    "signature" to purchase.signature,
                    "sku" to purchase.sku)
        }

        @kotlin.jvm.JvmStatic
        fun skuDetails(skuDetails: SkuDetails): HashMap<String, Any?> {
            return hashMapOf(
                    "description" to skuDetails.description,
                    "freeTrialPeriod" to skuDetails.freeTrialPeriod,
                    "introductoryPrice" to skuDetails.introductoryPrice,
                    "introductoryPriceAmountMicros" to skuDetails.introductoryPriceAmountMicros,
                    "introductoryPriceCycles" to skuDetails.introductoryPriceCycles,
                    "introductoryPricePeriod" to skuDetails.introductoryPricePeriod,
                    "price" to skuDetails.price,
                    "priceAmountMicros" to skuDetails.priceAmountMicros,
                    "priceCurrencyCode" to skuDetails.priceCurrencyCode,
                    "sku" to skuDetails.sku,
                    "subscriptionPeriod" to skuDetails.subscriptionPeriod,
                    "title" to skuDetails.title,
                    "type" to skuDetails.type,
                    "originalPrice" to skuDetails.originalPrice,
                    "originalPriceAmountMicros" to skuDetails.originalPriceAmountMicros)
        }
    }
}