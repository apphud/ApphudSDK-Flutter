package com.apphud.fluttersdk

import com.android.billingclient.api.Purchase
import com.android.billingclient.api.SkuDetails
import com.apphud.sdk.ApphudError
import com.apphud.sdk.domain.ApphudNonRenewingPurchase
import com.apphud.sdk.domain.ApphudPaywall
import com.apphud.sdk.domain.ApphudProduct
import com.apphud.sdk.domain.ApphudSubscription
import java.util.*
import kotlin.collections.HashMap

fun ApphudPaywall.toMap(): HashMap<String, Any?> {
    return hashMapOf(
            "name" to name,
            "identifier" to identifier,
            "default" to default,
            "json" to json,
            "products" to products?.map { it.toMap() }
    )
}

fun ApphudProduct.toMap(): HashMap<String, Any?> {
    return hashMapOf(
            "productId" to productId,
            "name" to name,
            "store" to store,
            "paywallId" to paywallId,
            "skuDetails" to skuDetails?.toMap()
    )
}


fun SkuDetails.toMap(): HashMap<String, Any?> {
    return hashMapOf(
            "description" to description,
            "freeTrialPeriod" to freeTrialPeriod,
            "introductoryPrice" to introductoryPrice,
            "introductoryPriceAmountMicros" to introductoryPriceAmountMicros,
            "introductoryPriceCycles" to introductoryPriceCycles,
            "introductoryPricePeriod" to introductoryPricePeriod,
            "price" to price,
            "priceAmountMicros" to priceAmountMicros,
            "priceCurrencyCode" to priceCurrencyCode,
            "sku" to sku,
            "subscriptionPeriod" to subscriptionPeriod,
            "title" to title,
            "type" to type,
            "originalPrice" to originalPrice,
            "originalPriceAmountMicros" to originalPriceAmountMicros
    )
}


fun ApphudError.toMap(): HashMap<String, Any?> {
    return hashMapOf(
            "message" to message,
            "errorCode" to errorCode
    )
}

fun Purchase.toMap(): HashMap<String, Any?> {
    return hashMapOf(
            "orderId" to orderId,
            "originalJson" to originalJson,
            "packageName" to packageName,
            "purchaseState" to purchaseState,
            "purchaseTime" to purchaseTime,
            "purchaseToken" to purchaseToken,
            "signature" to signature,
            "sku" to sku
    )
}


fun ApphudNonRenewingPurchase.toMap(): HashMap<String, Any?> {
    return hashMapOf(
            "productId" to productId,
            "purchasedAt" to purchasedAt,
            "canceledAt" to canceledAt,
            "isActive" to isActive())
}

fun ApphudSubscription.toMap(): HashMap<String, Any?> {
    return hashMapOf(
            "productId" to productId,
            "expiresAt" to expiresAt,
            "startedAt" to startedAt,
            "canceledAt" to cancelledAt,
            "isInRetryBilling" to isInRetryBilling,
            "isAutorenewEnabled" to isAutoRenewEnabled,
            "isIntroductoryActivated" to isIntroductoryActivated,
            "isActive" to isActive(),
            "status" to status.name.toLowerCase(Locale.ROOT))
}
