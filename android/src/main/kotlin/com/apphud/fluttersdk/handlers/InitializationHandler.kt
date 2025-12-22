package com.apphud.fluttersdk.handlers

import android.content.Context
import com.apphud.fluttersdk.toMap
import com.apphud.sdk.Apphud
import com.apphud.sdk.ApphudUtils
//import com.apphud.sdk.client.HttpUrlConnectionExecutor
import io.flutter.plugin.common.MethodChannel


class InitializationHandler(
    override val routes: List<String>,
    val context: Context,
    handleOnMainThreadP: HandleOnMainThread
) : Handler {
    private var handleOnMainThread = handleOnMainThreadP

    override fun tryToHandle(
        method: String,
        args: Map<String, Any>?,
        result: MethodChannel.Result
    ) {
        when (method) {
            InitializationRoutes.start.name -> StartParser(result).parse(args) { apiKey, userId, observer, baseUrl ->
                start(apiKey, userId, observerMode = observer, baseUrl = baseUrl, result)
            }

            InitializationRoutes.startManually.name -> StartManuallyParser(result).parse(args) { apiKey, userId, deviceId, observer, baseUrl ->
                startManually(apiKey, userId, deviceId, observerMode = observer, baseUrl = baseUrl, result)
            }

            InitializationRoutes.updateUserID.name -> UpdateUserIDParser(result).parse(args) { userId ->
                updateUserID(userId, result)
            }

            InitializationRoutes.userID.name -> userID(result)
            InitializationRoutes.deviceID.name -> deviceID(result)
            InitializationRoutes.logout.name -> logout(result)
        }
    }

    private fun start(apiKey: String, userId: String?, observerMode: Boolean, baseUrl: String?, result: MethodChannel.Result) {
        Apphud.start(context = context, apiKey = apiKey, userId = userId, observerMode = observerMode) { user ->
            handleOnMainThread { result.success(user.toMap()) }
        }
        if (baseUrl != null) {
            ApphudUtils.overrideBaseUrl(baseUrl!!)
        }
    }

    private fun startManually(
        apiKey: String,
        userId: String?,
        deviceId: String?,
        observerMode: Boolean,
        baseUrl: String?,
        result: MethodChannel.Result
    ) {
        Apphud.start(
            context = context,
            apiKey = apiKey,
            userId = userId,
            deviceId = deviceId,
            observerMode = observerMode
        ) { user ->
            handleOnMainThread { result.success(user.toMap()) }
        }
        if (baseUrl != null) {
            ApphudUtils.overrideBaseUrl(baseUrl!!)
        }
    }

    private fun updateUserID(userId: String, result: MethodChannel.Result) {
        Apphud.updateUserId(userId = userId) {  user ->
            handleOnMainThread { result.success(user?.toMap()) }
        }
    }

    private fun userID(result: MethodChannel.Result) {
        val userId = Apphud.userId()
        handleOnMainThread { result.success(userId) }
    }

    private fun deviceID(result: MethodChannel.Result) {
        val deviceId = Apphud.deviceId();
        handleOnMainThread { result.success(deviceId) }
    }

    private fun logout(result: MethodChannel.Result) {
        Apphud.logout()
        handleOnMainThread { result.success(null) }
    }

    class StartParser(val result: MethodChannel.Result) {

        fun parse(args: Map<String, Any>?, callback: (apiKey: String, userId: String?, observerMode: Boolean, baseUrl: String?) -> Unit) {
            try {
                args ?: throw IllegalArgumentException("apiKey is required argument")
                val apiKey = args["apiKey"] as? String
                    ?: throw IllegalArgumentException("apiKey is required argument")
                val userId = args["userID"] as? String
                val observerMode = args["observerMode"] as? Boolean
                val baseUrl = args["baseUrl"] as? String
                callback(apiKey, userId, observerMode ?: false, baseUrl)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }

    class StartManuallyParser(val result: MethodChannel.Result) {
        fun parse(
            args: Map<String, Any>?,
            callback: (apiKey: String, userId: String?, deviceId: String?, observerMode: Boolean, baseUrl: String?) -> Unit
        ) {
            try {
                args ?: throw IllegalArgumentException("apiKey is required argument")
                val apiKey = args["apiKey"] as? String
                    ?: throw IllegalArgumentException("apiKey is required argument")
                val userId = args["userID"] as? String
                val deviceId = args["deviceID"] as? String
                val observerMode = args["observerMode"] as? Boolean
                val baseUrl = args["baseUrl"] as? String
                callback(apiKey, userId, deviceId, observerMode ?: false, baseUrl)
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
