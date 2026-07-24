package com.apphud.fluttersdk.handlers

import android.app.Activity
import com.apphud.fluttersdk.toMap
import com.apphud.sdk.ApphudError
import com.apphud.sdk.ApphudPurchaseResult
import com.apphud.sdk.ApphudRuleCallback
import com.apphud.sdk.ApphudScreenDismissAction
import com.apphud.sdk.domain.ApphudPaywall
import com.apphud.sdk.domain.ApphudProduct
import com.apphud.sdk.domain.Rule
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * Process-scoped Rules callback passed into [com.apphud.sdk.Apphud.start].
 * The MethodChannel is rebound when the Flutter engine attaches/detaches.
 * Gates always auto-allow (events-only bridge).
 */
object ApphudRuleCallbackHandler : ApphudRuleCallback, MethodChannel.MethodCallHandler {
    @Volatile
    var activity: Activity? = null

    private var channel: MethodChannel? = null
    private var isListeningStarted: Boolean = false
    private var handleOnMainThread: HandleOnMainThread = { it() }

    fun bind(channel: MethodChannel, handleOnMainThread: HandleOnMainThread) {
        this.channel?.setMethodCallHandler(null)
        this.channel = channel
        this.handleOnMainThread = handleOnMainThread
        channel.setMethodCallHandler(this)
    }

    fun unbind() {
        channel?.setMethodCallHandler(null)
        channel = null
        isListeningStarted = false
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startListening" -> {
                isListeningStarted = true
                result.success(null)
            }

            "stopListening" -> {
                isListeningStarted = false
                result.success(null)
            }

            else -> result.notImplemented()
        }
    }

    private fun invoke(method: String, arguments: Any?) {
        if (!isListeningStarted) return
        handleOnMainThread {
            channel?.invokeMethod(method, arguments)
        }
    }

    override fun provideActivity(): Activity? = activity

    override fun shouldPerformRule(rule: Rule): Boolean = true

    override fun shouldShowScreen(rule: Rule): Boolean = true

    override fun onScreenDismissAction(rule: Rule): ApphudScreenDismissAction =
        ApphudScreenDismissAction.THANK_AND_CLOSE

    override fun onScreenAppeared(rule: Rule) {
        invoke(
            "apphudRuleScreenDidAppear",
            hashMapOf("rule" to rule.toMap())
        )
    }

    override fun onWillPurchase(rule: Rule, product: ApphudProduct?) {
        invoke(
            "apphudRuleWillPurchase",
            hashMapOf(
                "rule" to rule.toMap(),
                "product" to product?.toMap(),
            )
        )
    }

    override fun onPurchaseCompleted(rule: Rule, result: ApphudPurchaseResult) {
        invoke(
            "apphudRulePurchaseCompleted",
            hashMapOf(
                "rule" to rule.toMap(),
                "result" to result.toMap(),
            )
        )
    }

    override fun onScreenWillDismiss(rule: Rule, error: ApphudError?) {
        invoke(
            "apphudRuleScreenWillDismiss",
            hashMapOf(
                "rule" to rule.toMap(),
                "error" to error?.message,
            )
        )
    }

    override fun onScreenDidDismiss(rule: Rule) {
        invoke(
            "apphudRuleScreenDidDismiss",
            hashMapOf("rule" to rule.toMap())
        )
    }

    override fun onDidSelectSurveyAnswer(rule: Rule, question: String, answer: String) {
        invoke(
            "apphudRuleDidSelectSurveyAnswer",
            hashMapOf(
                "rule" to rule.toMap(),
                "question" to question,
                "answer" to answer,
            )
        )
    }

    override fun onRulePaywallWithoutScreen(rule: Rule, paywall: ApphudPaywall) {
        invoke(
            "apphudRulePaywallWithoutScreen",
            hashMapOf(
                "rule" to rule.toMap(),
                "paywall" to paywall.toMap(),
            )
        )
    }
}
