package com.apphud.fluttersdk.handlers

import com.apphud.fluttersdk.toMap
import com.apphud.sdk.Apphud
import com.apphud.sdk.ApphudPurchasesRestoreResult
import io.flutter.plugin.common.MethodChannel

class HandlePurchasesHandler(
    override val routes: List<String>,
    handleOnMainThreadP: HandleOnMainThread
) : Handler {
    private var handleOnMainThread = handleOnMainThreadP

    override fun tryToHandle(
        method: String,
        args: Map<String, Any>?,
        result: MethodChannel.Result
    ) {
        when (method) {
            HandlePurchasesRoutes.hasActiveSubscription.name -> hasActiveSubscription(result)
            HandlePurchasesRoutes.subscription.name -> subscription(result)
            HandlePurchasesRoutes.subscriptions.name -> subscriptions(result)
            HandlePurchasesRoutes.nonRenewingPurchases.name -> nonRenewingPurchases(result)
            HandlePurchasesRoutes.isNonRenewingPurchaseActive.name ->
                IsNonRenewingPurchaseActiveParser(result).parse(args) { productId ->
                    isNonRenewingPurchaseActive(productId, result)
                }

            HandlePurchasesRoutes.restorePurchases.name -> restorePurchases(result)
            HandlePurchasesRoutes.hasPremiumAccess.name -> hasPremiumAccess(result)
            HandlePurchasesRoutes.refreshUserData.name -> refreshUserData(result)
        }
    }

    private fun refreshUserData(result: MethodChannel.Result) {
        Apphud.refreshUserData { user ->
            handleOnMainThread { result.success(user?.toMap()) }
        }
    }

    private fun hasActiveSubscription(result: MethodChannel.Result) {
        val isHasActiveSubscription = Apphud.hasActiveSubscription()
        handleOnMainThread { result.success(isHasActiveSubscription) }
    }

    private fun hasPremiumAccess(result: MethodChannel.Result) {
        val isHasActiveSubscription = Apphud.hasPremiumAccess()
        handleOnMainThread { result.success(isHasActiveSubscription) }
    }

    private fun subscription(result: MethodChannel.Result) {
        val subscription = Apphud.subscription()
        handleOnMainThread { result.success(subscription?.toMap()) }
    }

    private fun subscriptions(result: MethodChannel.Result) {
        val subscriptions = Apphud.subscriptions()
        val jsonList: List<HashMap<String, Any?>> = subscriptions.map {
            it.toMap()
        }

        handleOnMainThread { result.success(jsonList) }
    }


    private fun nonRenewingPurchases(result: MethodChannel.Result) {
        val nonRenewingPurchases = Apphud.nonRenewingPurchases()

        val jsonList = nonRenewingPurchases.map { np ->
            np.toMap()
        }

        handleOnMainThread { result.success(jsonList) }
    }

    private fun isNonRenewingPurchaseActive(productId: String, result: MethodChannel.Result) {
        val isNonRenewingPurchaseActive = Apphud.isNonRenewingPurchaseActive(productId = productId)
        handleOnMainThread { result.success(isNonRenewingPurchaseActive) }
    }

    private fun restorePurchases(result: MethodChannel.Result) {
        Apphud.restorePurchases { restoreResult ->

            val resultMap = hashMapOf<String, Any?>()

            when (restoreResult) {
                is ApphudPurchasesRestoreResult.Success -> {
                    restoreResult.subscriptions?.let {
                        val subscriptionJsonList: List<HashMap<String, Any?>> = it.map { s ->
                            s.toMap()
                        }
                        resultMap["subscriptions"] = subscriptionJsonList
                    }
                    restoreResult.purchases?.let {
                        val nrPurchasesJsonList: List<HashMap<String, Any?>> = it.map { p ->
                            p.toMap()
                        }
                        resultMap["nrPurchases"] = nrPurchasesJsonList
                    }
                }
                is ApphudPurchasesRestoreResult.Error -> {
                    restoreResult.error.let { e ->
                        resultMap["error"] = e.toMap()
                    }
                }
            }
            handleOnMainThread { result.success(resultMap) }
        }
    }
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

enum class HandlePurchasesRoutes {
    hasActiveSubscription,
    subscription,
    subscriptions,
    nonRenewingPurchases,
    isNonRenewingPurchaseActive,
    restorePurchases,
    hasPremiumAccess,
    refreshUserData;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
