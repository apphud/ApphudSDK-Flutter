package com.apphud.fluttersdk.handlers

import com.apphud.sdk.Apphud
import com.apphud.sdk.ApphudAttributionProvider
import io.flutter.plugin.common.MethodChannel

class AttributionHandler(
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
            AttributionRoutes.addAttribution.name -> AttributionParser(result).parse(args) { provider, data, identifier ->
                addAttribution(provider, data, identifier, result)
            }
            AttributionRoutes.collectSearchAdsAttribution.name -> result.notImplemented()
        }
    }

    private fun addAttribution(
        provider: ApphudAttributionProvider,
        data: Map<String, Any>?,
        identifier: String?, result: MethodChannel.Result
    ) {
        Apphud.addAttribution(provider, data, identifier)
        handleOnMainThread { result.success(true) }
    }

    class AttributionParser(val result: MethodChannel.Result) {
        fun parse(
            args: Map<String, Any>?, callback: (
                provider: ApphudAttributionProvider,
                data: Map<String, Any>?,
                identifier: String?
            ) -> Unit
        ) {
            try {
                args ?: throw IllegalArgumentException("provider is required arguments")
                val providerString = args["from"] as? String
                    ?: throw IllegalArgumentException("provider is required argument")
                val provider = getProviderFromString(providerString)
                    ?: throw IllegalArgumentException("You need to pass correct attribution provider")
                val data = args["data"] as? Map<String, Any>?
                val identifier = args["identifier"] as? String

                callback(provider, data, identifier)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }

        private fun getProviderFromString(providerString: String): ApphudAttributionProvider? {
            return when (providerString) {
                "appsFlyer" -> ApphudAttributionProvider.appsFlyer
                "adjust" -> ApphudAttributionProvider.adjust
                "firebase" -> ApphudAttributionProvider.firebase
                "custom" -> ApphudAttributionProvider.custom
                "facebook" -> ApphudAttributionProvider.facebook
                "appleAdsAttribution" -> throw IllegalArgumentException("appleAdsAttribution can not be provider for android platform")
                else -> {
                    return null
                }
            }
        }
    }
}

enum class AttributionRoutes {

    addAttribution,
    collectSearchAdsAttribution;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
