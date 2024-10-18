package com.apphud.fluttersdk.handlers

import com.apphud.sdk.Apphud
import com.apphud.sdk.domain.ApphudGroup
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch


@OptIn(DelicateCoroutinesApi::class)
class PromotionalsHandler(
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
            PromotionalsRoutes.grantPromotional.name ->
                PromotionalsParser(result).parse(args) { daysCount, productId, groupName ->
                    GlobalScope.launch {
                        val permissionGroup =
                            Apphud.fetchPermissionGroups().firstOrNull { it.name == groupName }

                        Apphud.grantPromotional(
                            daysCount,
                            productId,
                            permissionGroup
                        ) { isGranted ->
                            handleOnMainThread { result.success(isGranted) }
                        }
                    }
                }
        }
    }
}

class PromotionalsParser(private val result: MethodChannel.Result) {
    fun parse(
        args: Map<String, Any>?,
        callback: (daysCount: Int, productId: String?, groupName: String?) -> Unit
    ) {
        try {
            args ?: throw IllegalArgumentException("arguments are required")
            val daysCount = args["daysCount"] as? Int
                ?: throw IllegalArgumentException("daysCount is required argument")
            val productId = args["productId"] as? String
            val groupName = args["permissionGroupName"] as? String
            callback(daysCount, productId, groupName)
        } catch (e: IllegalArgumentException) {
            result.error("400", e.message, "")
        }
    }
}

enum class PromotionalsRoutes {
    grantPromotional;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
