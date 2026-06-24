package com.apphud.fluttersdk.handlers

import android.app.Activity
import com.apphud.sdk.Apphud
import com.apphud.sdk.ApphudDeeplinkAttributionKind
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * Bridges the native deep link attribution handler to Flutter over the
 * `apphud/deeplink` method channel.
 *
 * Direct deep links are fed to the native SDK by the host app's Activity (via
 * `Apphud.handleIntent(intent)`); this bridge only forwards the resulting
 * attribution back to Flutter and triggers deferred attribution.
 */
class ApphudDeeplinkBridge(handleOnMainThreadP: HandleOnMainThread) :
    MethodChannel.MethodCallHandler {

    private var handleOnMainThread = handleOnMainThreadP
    private var channel: MethodChannel? = null
    var activity: Activity? = null

    fun setMethodCallHandler(channel: MethodChannel?) {
        this.channel?.setMethodCallHandler(null)
        if (channel == null) {
            this.channel = null
        } else {
            this.channel = channel
            this.channel!!.setMethodCallHandler(this)
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setDeeplinkHandler" -> {
                val enabled = call.argument<Boolean>("enabled") ?: false
                setDeeplinkHandler(enabled)
                result.success(null)
            }

            "requestDeferredDeeplinkAttribution" -> {
                requestDeferredDeeplinkAttribution(result)
            }

            else -> result.notImplemented()
        }
    }

    private fun setDeeplinkHandler(enabled: Boolean) {
        if (enabled) {
            Apphud.setDeeplinkHandler { attribution, kind, uri ->
                val kindString = when (kind) {
                    ApphudDeeplinkAttributionKind.DEFERRED -> "deferred"
                    else -> "direct"
                }
                val arguments = hashMapOf<String, Any?>(
                    "attribution" to attribution,
                    "kind" to kindString,
                    "url" to uri?.toString(),
                )
                handleOnMainThread {
                    channel?.invokeMethod("onDeeplinkAttribution", arguments)
                }
            }
        } else {
            Apphud.setDeeplinkHandler(null)
        }
    }

    private fun requestDeferredDeeplinkAttribution(result: MethodChannel.Result) {
        val activity = this.activity
        if (activity == null) {
            handleOnMainThread {
                result.error(
                    "no_activity",
                    "Deferred deep link attribution requires an attached Activity. " +
                        "Call requestDeferredDeeplinkAttribution() while the app is in the foreground.",
                    null,
                )
            }
            return
        }
        Apphud.requestDeferredDeeplinkAttribution(activity)
        handleOnMainThread { result.success(null) }
    }
}
