package com.apphud.fluttersdk.handlers

import com.android.billingclient.api.ProductDetails
import com.apphud.fluttersdk.toMap
import com.apphud.sdk.Apphud
import com.apphud.sdk.ApphudListener
import com.apphud.sdk.domain.ApphudNonRenewingPurchase
import com.apphud.sdk.domain.ApphudPaywall
import com.apphud.sdk.domain.ApphudSubscription
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class ApphudListenerHandler() : MethodChannel.MethodCallHandler,
    ApphudListener {
    private var isListeningStarted: Boolean = false
    private var channel: MethodChannel? = null
    private var userIdCached: String? = null
    private var detailsCached: List<ProductDetails>? = null
    private var paywallsCached: List<ApphudPaywall>? = null
    private var didUserLoad: Boolean = false
    private var subscriptionsCached: List<ApphudSubscription>? = null
    private var purchasesCached: List<ApphudNonRenewingPurchase>? = null


    init {
        Apphud.setListener(this)
    }

    fun setMethodCallHandler(channel: MethodChannel?) {
        this.channel?.setMethodCallHandler(null);
        if (channel == null) {
            isListeningStarted = false
            this.channel = null
        } else {
            this.channel = channel
            this.channel!!.setMethodCallHandler(this)
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startListening" -> {
                start()
                result.success(null)
            }

            "stopListening" -> {
                stop()
                result.success(null)
            }
        }
    }

    private fun start() {
        isListeningStarted = true
        userIdCached?.let { v -> apphudDidChangeUserID(v) }
        detailsCached?.let { v -> apphudFetchProductDetails(v) }
        paywallsCached?.let { v -> paywallsDidFullyLoad(v) }
        if (didUserLoad) userDidLoad()
        subscriptionsCached?.let { v -> apphudSubscriptionsUpdated(v) }
        purchasesCached?.let { v -> apphudNonRenewingPurchasesUpdated(v) }
    }

    private fun stop() {
        isListeningStarted = false
    }

    override fun apphudDidChangeUserID(userId: String) {
        userIdCached = userId
        if (isListeningStarted) {
            channel?.invokeMethod("didChangeUserID", userId)
        }
    }

    override fun apphudFetchProductDetails(details: List<ProductDetails>) {
        detailsCached = details
        if (isListeningStarted) {
            val resultMap: List<HashMap<String, Any?>> = details.map {
                it.toMap()
            }
            channel?.invokeMethod("fetchNativeProducts", resultMap)
        }
    }

    override fun paywallsDidFullyLoad(paywalls: List<ApphudPaywall>) {
        paywallsCached = paywalls
        if (isListeningStarted) {
            val resultMap = hashMapOf<String, Any?>()
            resultMap["paywalls"] = paywalls.map { paywall -> paywall.toMap() }
            channel?.invokeMethod("paywallsDidFullyLoad", resultMap)
        }
    }

    override fun userDidLoad() {
        didUserLoad = true
        if (isListeningStarted) {
            val resultMap = hashMapOf<String, Any?>()
            resultMap["paywalls"] = Apphud.paywalls().map { paywall -> paywall.toMap() }
            channel?.invokeMethod("userDidLoad", resultMap)
        }
    }

    override fun apphudSubscriptionsUpdated(subscriptions: List<ApphudSubscription>) {
        subscriptionsCached = subscriptions
        if (isListeningStarted) {
            val resultMap: List<HashMap<String, Any?>> = subscriptions.map {
                it.toMap()
            }
            channel?.invokeMethod("apphudSubscriptionsUpdated", resultMap)
        }
    }

    override fun apphudNonRenewingPurchasesUpdated(purchases: List<ApphudNonRenewingPurchase>) {
        purchasesCached = purchases
        if (isListeningStarted) {
            val resultMap: List<HashMap<String, Any?>> = purchases.map {
                it.toMap()
            }
            channel?.invokeMethod("apphudNonRenewingPurchasesUpdated", resultMap)
        }
    }
}