package com.apphud.fluttersdk.handlers

import android.content.Context
import io.flutter.plugin.common.MethodChannel


class PaywallLogsHandler(override val routes: List<String>, val context: Context) : Handler {

    override fun tryToHandle(method: String, args: Map<String, Any>?, result: MethodChannel.Result) {
        when (method) {
            PaywallLogsRoutes.paywallShown.name -> result.notImplemented()
            PaywallLogsRoutes.paywallClosed.name -> result.notImplemented()
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
