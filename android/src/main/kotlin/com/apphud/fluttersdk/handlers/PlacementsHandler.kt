package com.apphud.fluttersdk.handlers

import com.apphud.fluttersdk.toMap
import com.apphud.sdk.Apphud
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.runBlocking

class PlacementsHandler(
    handleOnMainThreadP: HandleOnMainThread
) : Handler {
    private var handleOnMainThread = handleOnMainThreadP
    override val routes = PlacementsRoutes.stringValues()

    override fun tryToHandle(
        method: String,
        args: Map<String, Any>?,
        result: MethodChannel.Result
    ) {
        when (method) {
            PlacementsRoutes.placements.name -> placements(result)

            PlacementsRoutes.placement.name -> PlacementIdentifierParser(result).parse(args) { identifier ->
                placement(identifier, result)
            }
        }
    }

    private fun placements(result: MethodChannel.Result) {
        val placements = runBlocking { Apphud.placements() }
        handleOnMainThread { result.success(placements.map { p -> p.toMap() }) }
    }

    private fun placement(identifier: String, result: MethodChannel.Result) {
        val placement = runBlocking { Apphud.placement(identifier) }
        handleOnMainThread { result.success(placement?.toMap()) }
    }
}

class PlacementIdentifierParser(private val result: MethodChannel.Result) {
    fun parse(args: Map<String, Any>?, callback: (indentifier: String) -> Unit) {
        try {
            args ?: throw IllegalArgumentException("arguments are required")
            val identifier = args["identifier"] as? String
                ?: throw IllegalArgumentException("identifier is required argument")
            callback(identifier)
        } catch (e: IllegalArgumentException) {
            result.error("400", e.message, "")
        }
    }
}

enum class PlacementsRoutes {
    placements,
    placement;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}