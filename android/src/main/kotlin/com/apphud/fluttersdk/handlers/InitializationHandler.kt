package com.apphud.fluttersdk.handlers

import android.content.Context
import com.apphud.sdk.Apphud
//import com.apphud.sdk.client.HttpUrlConnectionExecutor
import io.flutter.plugin.common.MethodChannel


class InitializationHandler(override val routes: List<String>, val context: Context) : Handler {

    override fun tryToHandle(
        method: String,
        args: Map<String, Any>?,
        result: MethodChannel.Result
    ) {
        when (method) {
            InitializationRoutes.start.name -> StartParser(result).parse(args) { apiKey, userId ->
                start(apiKey, userId, result)
            }
            InitializationRoutes.startManually.name -> StartManuallyParser(result).parse(args) { apiKey, userId, deviceId ->
                startManually(apiKey, userId, deviceId, result)
            }
            InitializationRoutes.updateUserID.name -> UpdateUserIDParser(result).parse(args) { userId ->
                updateUserID(userId, result)
            }
            InitializationRoutes.userID.name -> userID(result)
            InitializationRoutes.deviceID.name -> deviceID(result)
            InitializationRoutes.logout.name -> logout(result)
        }
    }

    private fun start(apiKey: String, userId: String?, result: MethodChannel.Result) {
        Apphud.start(context = context, apiKey = apiKey, userId = userId)
        result.success(null)
    }

    private fun startManually(
        apiKey: String,
        userId: String?,
        deviceId: String?,
        result: MethodChannel.Result
    ) {
        Apphud.start(context = context, apiKey = apiKey, userId = userId, deviceId = deviceId)
        result.success(null)
    }

    private fun updateUserID(userId: String, result: MethodChannel.Result) {
        Apphud.updateUserId(userId = userId)
        result.success(null)
    }

    private fun userID(result: MethodChannel.Result) {
        val userId = Apphud.userId()
        result.success(userId)
    }

    private fun deviceID(result: MethodChannel.Result) {
        val deviceId = Apphud.deviceId();
        result.success(deviceId)
    }

    private fun logout(result: MethodChannel.Result) {
        Apphud.logout()
        result.success(null)
    }

    class StartParser(val result: MethodChannel.Result) {

        fun parse(args: Map<String, Any>?, callback: (apiKey: String, userId: String?) -> Unit) {
            try {
                args ?: throw IllegalArgumentException("apiKey is required argument")
                val apiKey = args["apiKey"] as? String
                    ?: throw IllegalArgumentException("apiKey is required argument")
                val userId = args["userID"] as? String

                callback(apiKey, userId)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }

    class StartManuallyParser(val result: MethodChannel.Result) {
        fun parse(
            args: Map<String, Any>?,
            callback: (apiKey: String, userId: String?, deviceId: String?) -> Unit
        ) {
            try {
                args ?: throw IllegalArgumentException("apiKey is required argument")
                val apiKey = args["apiKey"] as? String
                    ?: throw IllegalArgumentException("apiKey is required argument")
                val userId = args["userID"] as? String
                val deviceId = args["deviceID"] as? String

                callback(apiKey, userId, deviceId)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }

    class UpdateUserIDParser(val result: MethodChannel.Result) {
        fun parse(args: Map<String, Any>?, callback: (userId: String) -> Unit) {
            try {
                args ?: throw IllegalArgumentException("userID is required argument")
                val userId = args["userID"] as? String
                    ?: throw IllegalArgumentException("userID is required argument")

                callback(userId)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }
}

enum class InitializationRoutes {
    start,
    startManually,
    updateUserID,
    userID,
    deviceID,
    logout,
    setDelegate,
    setUIDelegate;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
