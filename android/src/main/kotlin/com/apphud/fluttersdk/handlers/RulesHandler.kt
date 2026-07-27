package com.apphud.fluttersdk.handlers

import com.apphud.fluttersdk.toMap
import com.apphud.sdk.Apphud
import io.flutter.plugin.common.MethodChannel

class RulesHandler(
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
            RulesRoutes.checkRules.name -> {
                Apphud.checkRules()
                handleOnMainThread { result.success(null) }
            }

            RulesRoutes.pendingRule.name -> {
                val rule = Apphud.pendingRule()
                handleOnMainThread { result.success(rule?.toMap()) }
            }

            RulesRoutes.showPendingScreen.name -> {
                Apphud.showPendingScreen { shown ->
                    handleOnMainThread { result.success(shown) }
                }
            }

            RulesRoutes.submitPushNotificationsToken.name -> {
                val token = args?.get("token") as? String
                if (token.isNullOrEmpty()) {
                    result.error("400", "token is required", null)
                    return
                }
                Apphud.submitPushNotificationsToken(token) { success ->
                    handleOnMainThread { result.success(success) }
                }
            }

            RulesRoutes.handlePushNotification.name -> {
                if (args == null) {
                    handleOnMainThread { result.success(false) }
                    return
                }
                val handled = Apphud.handlePushNotification(args)
                handleOnMainThread { result.success(handled) }
            }
        }
    }
}

enum class RulesRoutes {
    checkRules,
    pendingRule,
    showPendingScreen,
    submitPushNotificationsToken,
    handlePushNotification;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
