package com.apphud.fluttersdk

import com.android.billingclient.api.ProductDetails
import com.android.billingclient.api.Purchase
import com.apphud.sdk.ApphudError
import com.apphud.sdk.ApphudPurchaseResult
import com.apphud.sdk.domain.*
import java.util.*
import kotlin.collections.HashMap

fun ApphudPaywall.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "identifier" to identifier,
        "experimentName" to experimentName,
        "json" to json,
        "products" to products?.map { product -> product.toMap() },
        "placementIdentifier" to placementIdentifier,
        "variationName" to variationName,
        "parentPaywallIdentifier" to parentPaywallIdentifier,
        "hasScreen" to (screen != null),
        "screenName" to screenName,
    )
}

fun ApphudProduct.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "productId" to productId,
        "name" to name,
        "store" to store,
        "productDetails" to productDetails?.toMap(),
        "paywallIdentifier" to paywallIdentifier,
        "placementIdentifier" to placementIdentifier
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
        // Drop offers whose offerToken is null/blank: the Dart layer treats it
        // as required, and Google Play can return offers without a usable token
        // in edge cases (ineligible offers, pre-paid plans, certain SKU configs).
        // Including such offers used to break paywall parsing on the Dart side
        // ("null offerIdToken of SubscriptionOfferDetailsWrapper"), producing
        // empty paywalls for affected users.
        "subscriptionOfferDetails" to subscriptionOfferDetails
            ?.filter { !it.offerToken.isNullOrBlank() }
            ?.map { it.toMap() },
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
        "errorCode" to errorCode,
        "networkIssue" to networkIssue(),
        "billingResponseCode" to billingResponseCode(),
        "billingErrorTitle" to billingErrorTitle(),
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
        "isActive" to isActive(),
        "purchaseToken" to purchaseToken,
        "platform" to platform,
        "isConsumable" to isConsumable
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
        "status" to status.name.lowercase(Locale.ROOT),
        "purchaseToken" to purchaseToken,
        "platform" to platform,
        "basePlanId" to basePlanId
    )
}

fun ApphudGroup.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "name" to name,
        "productIds" to productIds(),
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
    val placementIdentifier = this["placementIdentifier"] as? String
    return ApphudProduct(
        id = id,
        productId = productId,
        name = name,
        store = store,
        paywallId = paywallId,
        productDetails = null,
        paywallIdentifier = paywallIdentifier,
        placementIdentifier = placementIdentifier,
        placementId = null,
        basePlanId = null,
        itemId = ""
    )
}

fun ApphudPlacement.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "identifier" to identifier,
        "paywall" to paywall?.toMap(),
        "experimentName" to experimentName,
        "variationName" to variationName,
    )
}

fun ApphudUser.toMap(): HashMap<String, Any?> {
    val placements = rawPlacements()
    return hashMapOf(
        "userId" to userId,
        "subscriptions" to subscriptions.map { s -> s.toMap() },
        "purchases" to purchases.map { p -> p.toMap() },
        "rawPlacements" to placements.map { p -> p.toMap() },
        "hasPurchases" to hasPurchases(),
        "totalDevicesCount" to totalDevicesCount,
        "internalId" to internalId,
        "experimentName" to experimentName,
        "variationName" to variationName,
        "targetingName" to targetingName,
        "remoteConfigString" to remoteConfigString,
    )
}

fun Rule.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "ruleName" to (ruleName ?: ""),
        "screenName" to (screenName ?: ""),
        "screenId" to screenId,
        "paywallId" to paywallId,
        "paywallIdentifier" to paywallIdentifier,
    )
}

fun ApphudPurchaseResult.toMap(): HashMap<String, Any?> {
    return hashMapOf(
        "subscription" to subscription?.toMap(),
        "nonRenewingPurchase" to nonRenewingPurchase?.toMap(),
        "purchase" to purchase?.toMap(),
        "error" to error?.toMap(),
        "isRestore" to false,
    )
}