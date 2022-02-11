package com.apphud.fluttersdk.handlers

import android.content.Context
import com.apphud.sdk.Apphud
import com.apphud.sdk.ApphudError
import com.apphud.sdk.domain.ApphudPaywall
import io.flutter.plugin.common.MethodChannel


class PaywallLogsHandler(override val routes: List<String>, val context: Context) : Handler {

    override fun tryToHandle(
        method: String,
        args: Map<String, Any>?,
        result: MethodChannel.Result
    ) {
        when (method) {
            PaywallLogsRoutes.paywallShown.name -> PaywallParser(result).parse(args) { paywall ->
                paywallShown(paywall, result)
            }
            PaywallLogsRoutes.paywallClosed.name -> PaywallParser(result).parse(args) { paywall ->
                paywallClosed(paywall, result)
            }
        }
    }

    private fun paywallShown(paywall: ApphudPaywall, result: MethodChannel.Result) {
        Apphud.paywallShown(paywall)
        result.success(null)
    }

    private fun paywallClosed(paywall: ApphudPaywall, result: MethodChannel.Result) {
        Apphud.paywallClosed(paywall)
        result.success(null)
    }
}

class PaywallParser(private val result: MethodChannel.Result) {
    fun parse(args: Map<String, Any>?, callback: (paywall: ApphudPaywall) -> Unit) {
        try {
            args ?: throw IllegalArgumentException("arguments are required")
            val identifier = args["identifier"] as? String
                ?: throw IllegalArgumentException("identifier is required argument")
            val paywall = Apphud.paywalls().firstOrNull { it.identifier == identifier }
                ?: throw IllegalArgumentException(
                    "There isn't the paywall with identifier $identifier"
                )
            callback(paywall)
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
