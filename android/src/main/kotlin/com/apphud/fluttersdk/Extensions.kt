package com.apphud.fluttersdk

import com.android.billingclient.api.AccountIdentifiers
import com.android.billingclient.api.ProductDetails
import com.android.billingclient.api.Purchase
import com.android.billingclient.api.SkuDetails
import com.apphud.sdk.ApphudError
import com.apphud.sdk.domain.*
import java.util.*
import kotlin.collections.HashMap

fun ApphudPaywall.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "identifier" to identifier,
        "experimentName" to experimentName,
        "json" to json,
        "products" to products?.map { it.toMap() }
    )
}

fun ApphudProduct.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "productId" to productId,
        "name" to name,
        "store" to store,
        "productDetails" to productDetails?.toMap(),
        "paywallIdentifier" to paywallIdentifier
    )
}


fun ProductDetails.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "description" to description,
        "name" to name,
        "productId" to productId,
        "productType" to productType,
        "title" to title,
        "oneTimePurchaseOfferDetails" to oneTimePurchaseOfferDetails?.toMap(),
        "subscriptionOfferDetails" to subscriptionOfferDetails?.map { it.toMap() },
    )
}

fun ProductDetails.OneTimePurchaseOfferDetails.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "priceAmountMicros" to priceAmountMicros,
        "formattedPrice" to formattedPrice,
        "priceCurrencyCode" to priceCurrencyCode,
    )
}

fun ProductDetails.SubscriptionOfferDetails.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "basePlanId" to basePlanId,
        "offerId" to offerId,
        "offerTags" to offerTags,
        "offerToken" to offerToken,
        "pricingPhases" to pricingPhases.pricingPhaseList.map { it.toMap() },
    )
}

fun ProductDetails.PricingPhase.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "billingCycleCount" to billingCycleCount,
        "recurrenceMode" to recurrenceMode,
        "priceAmountMicros" to priceAmountMicros,
        "billingPeriod" to billingPeriod,
        "formattedPrice" to formattedPrice,
        "priceCurrencyCode" to priceCurrencyCode,
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
        "purchaseState" to purchaseState,
        "purchaseTime" to purchaseTime,
        "orderId" to orderId,
        "purchaseToken" to purchaseToken,
        "productId" to if (products.isEmpty()) null else products[0],
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
        "status" to status.name.lowercase(Locale.ROOT)
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
        productId = productId,
        name = name,
        store = store,
        paywallId = paywallId,
        productDetails = null,
        paywallIdentifier = paywallIdentifier,
        placementIdentifier = null,
        placementId = null,
        basePlanId = null
    )
}

fun ApphudPlacement.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "identifier" to identifier,
        "paywall" to paywall?.toMap(),
        "experimentName" to experimentName
    )
}

fun ApphudUser.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "userId" to userId,
        "subscriptions" to subscriptions.map { s -> s.toMap() },
        "purchases" to purchases.map { p -> p.toMap() },
        "rawPlacements" to rawPlacements().map { p -> p.toMap() },
        "rawPaywalls" to rawPaywalls().map { p -> p.toMap() },
        "hasPurchases" to hasPurchases()
    )
}