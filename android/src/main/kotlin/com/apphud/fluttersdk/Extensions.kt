package com.apphud.fluttersdk

import com.android.billingclient.api.Purchase
import com.android.billingclient.api.SkuDetails
import com.apphud.sdk.ApphudError
import com.apphud.sdk.domain.*
import java.util.*
import kotlin.collections.HashMap

fun ApphudPaywall.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "identifier" to identifier,
        "isDefault" to default,
        "experimentName" to experimentName,
        "variationName" to variationName,
        "json" to json,
        "products" to products?.map { it.toMap() }
    )
}

fun ApphudProduct.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "productId" to product_id,
        "name" to name,
        "store" to store,
        "paywallId" to paywall_id,
        "skuDetails" to skuDetails?.toMap(),
        "paywallIdentifier" to paywall_identifier
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
        "skus" to skus.map { it }
    )
}


fun ApphudNonRenewingPurchase.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "productId" to productId,
        "purchasedAt" to purchasedAt,
        "canceledAt" to canceledAt,
        "isActive" to isActive()
    )
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
        "status" to status.name.toLowerCase(Locale.ROOT)
    )
}

fun ApphudGroup.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "name" to name,
        "products" to products?.map { it.toMap() },
        "hasAccess" to hasAccess()
    )
}

fun Map<String, Any>.toApphudProduct(): ApphudProduct {
    val productId = this["productId"] as? String
        ?: throw IllegalArgumentException("productId is required argument")
    val id = this["id"] as? String
    val name = this["name"] as? String
    val store = this["store"] as? String
        ?: throw IllegalArgumentException("store is required argument")
    val paywallId = this["paywallId"] as? String
    val paywallIdentifier = this["paywallIdentifier"] as? String

    return ApphudProduct(
        id = id,
        product_id = productId,
        name = name,
        store = store,
        paywall_id = paywallId,
        skuDetails = null,
        paywall_identifier = paywallIdentifier
    )
}