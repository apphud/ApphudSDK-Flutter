package com.apphud.fluttersdk.handlers

import android.content.Context
import com.apphud.sdk.Apphud
import com.apphud.sdk.ApphudUtils
import io.flutter.plugin.common.MethodChannel


class OtherHandler(
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
            OtherRoutes.enableDebugLogs.name -> enableDebugLogs(result)
            OtherRoutes.isSandbox.name -> result.notImplemented()
            OtherRoutes.optOutOfTracking.name -> optOutOfTracking(result)
            OtherRoutes.collectDeviceIdentifiers.name -> collectDeviceIdentifiers(result)
            OtherRoutes.updateBaseUrl.name -> updateBaseUrl(args, result)
        }
    }

    private fun enableDebugLogs(result: MethodChannel.Result) {
        ApphudUtils.enableAllLogs()
        handleOnMainThread { result.success(null) }
    }

    private fun optOutOfTracking(result: MethodChannel.Result) {
        Apphud.optOutOfTracking()
        handleOnMainThread { result.success(null) }
    }

    private fun collectDeviceIdentifiers(result: MethodChannel.Result) {
        Apphud.collectDeviceIdentifiers()
        handleOnMainThread { result.success(null) }
    }

    private fun updateBaseUrl(args: Map<String, Any>?, result: MethodChannel.Result) {
        val url = args?.get("url") as? String
        if (url != null) {
            ApphudUtils.overrideBaseUrl(url)
        }
        handleOnMainThread { result.success(null) }
    }
}

enum class OtherRoutes {
    enableDebugLogs,
    isSandbox,
    optOutOfTracking,
    collectDeviceIdentifiers,
    updateBaseUrl;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
