package com.apphud.fluttersdk.handlers

import com.apphud.sdk.Apphud
import com.apphud.sdk.domain.ApphudGroup
import io.flutter.plugin.common.MethodChannel


class PromotionalsHandler(override val routes: List<String>) : Handler {
    override fun tryToHandle(
        method: String,
        args: Map<String, Any>?,
        result: MethodChannel.Result
    ) {
        when (method) {
            PromotionalsRoutes.grantPromotional.name ->
                PromotionalsParser(result).parse(args) { daysCount, productId, permissionGroup ->
                    Apphud.grantPromotional(daysCount, productId, permissionGroup) { isGranted ->
                        result.success(isGranted)
                    }
                }
        }
    }
}

class PromotionalsParser(private val result: MethodChannel.Result) {
    fun parse(
        args: Map<String, Any>?,
        callback: (daysCount: Int, productId: String?, permissionGroup: ApphudGroup?) -> Unit
    ) {
        try {
            args ?: throw IllegalArgumentException("arguments are required")
            val daysCount = args["daysCount"] as? Int
                ?: throw IllegalArgumentException("daysCount is required argument")
            val productId = args["productId"] as? String
            val groupName = args["permissionGroupName"] as? String
            val permissionGroup = Apphud.permissionGroups().firstOrNull { it.name == groupName }
            callback(daysCount, productId, permissionGroup)
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
