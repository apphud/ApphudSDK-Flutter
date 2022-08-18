package com.apphud.fluttersdk.handlers

import com.android.billingclient.api.SkuDetails
import com.apphud.fluttersdk.toMap
import com.apphud.sdk.Apphud
import com.apphud.sdk.ApphudListener
import com.apphud.sdk.domain.ApphudNonRenewingPurchase
import com.apphud.sdk.domain.ApphudPaywall
import com.apphud.sdk.domain.ApphudSubscription
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class ApphudListenerHandler(private val channel: MethodChannel) : MethodChannel.MethodCallHandler,
    ApphudListener {
    private var isListeningStarted: Boolean = false

    init {
        channel.setMethodCallHandler(this)
        Apphud.setListener(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startListening" -> start()
            "stopListening" -> stop()
        }
    }

    fun dispose() {
        isListeningStarted = false
        channel.setMethodCallHandler(null)
    }

    private fun start() {
        isListeningStarted = true
    }

    private fun stop() {
        isListeningStarted = false
    }

    override fun apphudDidChangeUserID(userId: String) {
        if (isListeningStarted) {
            channel.invokeMethod("didChangeUserID", userId)
        }
    }

    override fun apphudFetchSkuDetailsProducts(details: List<SkuDetails>) {
        if (isListeningStarted) {
            val resultMap: List<HashMap<String, Any?>> = details.map {
                it.toMap()
            }
            channel.invokeMethod("fetchNativeProducts", resultMap)
        }
    }

    override fun paywallsDidFullyLoad(paywalls: List<ApphudPaywall>) {
        if (isListeningStarted) {
            val resultMap = hashMapOf<String, Any?>()
            resultMap["paywalls"] = paywalls.map { paywall -> paywall.toMap() }
            channel.invokeMethod("paywallsDidFullyLoad", resultMap)
        }
    }

    override fun userDidLoad() {
        if (isListeningStarted) {
            val resultMap = hashMapOf<String, Any?>()
            resultMap["paywalls"] = Apphud.paywalls().map { paywall -> paywall.toMap() }
            channel.invokeMethod("userDidLoad", resultMap)
        }
    }

    override fun apphudSubscriptionsUpdated(subscriptions: List<ApphudSubscription>) {
        if (isListeningStarted) {
            val resultMap: List<HashMap<String, Any?>> = subscriptions.map {
                it.toMap()
            }
            channel.invokeMethod("apphudSubscriptionsUpdated", resultMap)
        }
    }

    override fun apphudNonRenewingPurchasesUpdated(purchases: List<ApphudNonRenewingPurchase>) {
        if (isListeningStarted) {
            val resultMap: List<HashMap<String, Any?>> = purchases.map {
                it.toMap()
            }
            channel.invokeMethod("apphudNonRenewingPurchasesUpdated", resultMap)
        }
    }
}