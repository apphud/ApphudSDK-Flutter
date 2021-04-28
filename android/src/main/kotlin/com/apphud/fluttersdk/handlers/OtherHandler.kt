package com.apphud.fluttersdk.handlers

import android.content.Context
import com.apphud.sdk.Apphud
import io.flutter.plugin.common.MethodChannel


class OtherHandler(override val routes: List<String>, val context: Context) : Handler {

    override fun tryToHandle(method: String, args: Map<String, Any>?, result: MethodChannel.Result) {
        when (method) {
            OtherRoutes.enableDebugLogs.name -> enableDebugLogs(result)
            OtherRoutes.isSandbox.name -> result.notImplemented()
        }
    }

    private fun enableDebugLogs(result: MethodChannel.Result) {
        Apphud.enableDebugLogs()
        result.success(null)
    }

}

enum class OtherRoutes {
    enableDebugLogs,
    isSandbox;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
