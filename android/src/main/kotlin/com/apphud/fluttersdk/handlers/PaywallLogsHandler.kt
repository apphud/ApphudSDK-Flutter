package com.apphud.fluttersdk.handlers

import com.apphud.fluttersdk.FlutterSdkCommon
import com.apphud.sdk.Apphud
import com.apphud.sdk.domain.ApphudPaywall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class PaywallLogsHandler(
    override val routes: List<String>,
    handleOnMainThreadP: HandleOnMainThread
) : Handler {
    private var handleOnMainThread = handleOnMainThreadP

    @OptIn(DelicateCoroutinesApi::class)
    override fun tryToHandle(
        method: String,
        args: Map<String, Any>?,
        result: MethodChannel.Result
    ) {
        when (method) {
            PaywallLogsRoutes.paywallShown.name -> PaywallParser(result).parse(args) { paywallIdentifier, placementIdentifier ->
                GlobalScope.launch {
                    val paywall =
                        FlutterSdkCommon.getPaywall(paywallIdentifier, placementIdentifier)
                    if (paywall != null) {
                        paywallShown(paywall, result)
                    } else {
                        result.error(
                            "400",
                            "There isn't the paywall with identifier $paywallIdentifier | placementIdentifier $placementIdentifier",
                            ""
                        )
                    }
                }
            }

            PaywallLogsRoutes.paywallClosed.name -> PaywallParser(result).parse(args) { paywallIdentifier, placementIdentifier ->
                GlobalScope.launch {
                    val paywall =
                        FlutterSdkCommon.getPaywall(paywallIdentifier, placementIdentifier)
                    if (paywall != null) {
                        paywallClosed(paywall, result)
                    } else {
                        result.error(
                            "400",
                            "There isn't the paywall with identifier $paywallIdentifier | placementIdentifier $placementIdentifier",
                            ""
                        )
                    }
                }
            }

        }
    }

    private fun paywallShown(paywall: ApphudPaywall, result: MethodChannel.Result) {
        Apphud.paywallShown(paywall)
        handleOnMainThread { result.success(null) }
    }

    private fun paywallClosed(paywall: ApphudPaywall, result: MethodChannel.Result) {
        Apphud.paywallClosed(paywall)
        handleOnMainThread { result.success(null) }
    }
}

class PaywallParser(private val result: MethodChannel.Result) {
    fun parse(
        args: Map<String, Any>?,
        callback: (paywallIdentifier: String, placementIdentifier: String?) -> Unit
    ) {
        try {
            args ?: throw IllegalArgumentException("arguments are required")
            val paywallIdentifier = args["identifier"] as? String
                ?: throw IllegalArgumentException("identifier is required argument")
            val placementIdentifier = args["placementIdentifier"] as? String
            callback(paywallIdentifier, placementIdentifier)
        } catch (e: IllegalArgumentException) {
            result.error("400", e.message, "")
        }
    }
}

enum class PaywallLogsRoutes {
    paywallShown,
    paywallClosed;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
