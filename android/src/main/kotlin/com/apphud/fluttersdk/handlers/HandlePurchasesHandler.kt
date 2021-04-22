package com.apphud.fluttersdk.handlers

import android.content.Context
import com.apphud.sdk.Apphud
import com.google.gson.Gson
import io.flutter.plugin.common.MethodChannel
import com.apphud.sdk.domain.ApphudSubscription


class HandlePurchasesHandler(override val routes: List<String>, val context: Context) : Handler {

    private val gson: Gson by lazy { Gson() }

    override fun tryToHandle(method: String, args: Map<String, Any>?, result: MethodChannel.Result) {
        when (method) {
            HandlePurchasesRoutes.hasActiveSubscription.name -> hasActiveSubscription(result)
            HandlePurchasesRoutes.subscription.name -> subscription(result)
            HandlePurchasesRoutes.subscriptions.name -> subscriptions(result)
            HandlePurchasesRoutes.nonRenewingPurchases.name -> nonRenewingPurchases(result)
            HandlePurchasesRoutes.isNonRenewingPurchaseActive.name -> IsNonRenewingPurchaseActiveParser(result).parse(args) { productId ->
                isNonRenewingPurchaseActive(productId, result)
            }
            HandlePurchasesRoutes.restorePurchases.name -> result.notImplemented()
            HandlePurchasesRoutes.migratePurchasesIfNeeded.name -> result.notImplemented()
            HandlePurchasesRoutes.fetchRawReceiptInfo.name -> result.notImplemented()
            HandlePurchasesRoutes.validateReceipt.name -> result.notImplemented()
        }
    }

    private fun hasActiveSubscription(result: MethodChannel.Result) {
        val isHasActiveSubscription = Apphud.hasActiveSubscription()
        result.success(isHasActiveSubscription)
    }

    private fun subscription(result: MethodChannel.Result) {
        val subscription = Apphud.subscription()
        if (subscription != null) {
            val dict:HashMap<String, Any?> = getSubscriptionMap(subscription)
            result.success(dict)
        } else {
            result.success(null)
        }
    }

    private fun subscriptions(result: MethodChannel.Result) {
        val subscriptions = Apphud.subscriptions()
        val jsonList: List<HashMap<String, Any?>> = subscriptions.map {
            getSubscriptionMap(it)
        }

        result.success(jsonList)
    }

    private fun getSubscriptionMap(subscription: ApphudSubscription): HashMap<String, Any?> {
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

    private fun nonRenewingPurchases(result: MethodChannel.Result) {
        val nonRenewingPurchases = Apphud.nonRenewingPurchases()

        val jsonList: List<HashMap<String, Any?>> = nonRenewingPurchases.map {
            hashMapOf(
                    "productId" to it.productId,
                    "purchasedAt" to it.purchasedAt,
                    "canceledAt" to it.canceledAt,
                    "isActive" to it.isActive())
        }

        result.success(jsonList)
    }

    private fun isNonRenewingPurchaseActive(productId: String, result: MethodChannel.Result) {
        val isNonRenewingPurchaseActive = Apphud.isNonRenewingPurchaseActive(productId = productId)
        result.success(isNonRenewingPurchaseActive)
    }

    private fun restorePurchases(result: MethodChannel.Result) {
        // not implemented
    }

    private fun migratePurchasesIfNeeded(result: MethodChannel.Result) {
        // not implemented
    }

    private fun fetchRawReceiptInfo(result: MethodChannel.Result) {
        // not implemented
    }

    class IsNonRenewingPurchaseActiveParser(val result: MethodChannel.Result) {
        fun parse(args: Map<String, Any>?, callback: (productId: String) -> Unit) {
            try {
                args ?: throw IllegalArgumentException("productIdentifier is required argument")
                val productId = args["productIdentifier"] as? String
                        ?: throw IllegalArgumentException("productIdentifier is required argument")

                callback(productId)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }
}


enum class HandlePurchasesRoutes {
    hasActiveSubscription,
    subscription,
    subscriptions,
    nonRenewingPurchases,
    isNonRenewingPurchaseActive,
    restorePurchases,
    migratePurchasesIfNeeded,
    fetchRawReceiptInfo,
    validateReceipt;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
