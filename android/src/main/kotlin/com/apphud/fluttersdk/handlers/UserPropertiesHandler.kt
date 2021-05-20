package com.apphud.fluttersdk.handlers

import android.content.Context
import com.apphud.sdk.Apphud
import com.apphud.sdk.ApphudUserPropertyKey
import io.flutter.plugin.common.MethodChannel


class UserPropertiesHandler(override val routes: List<String>, val context: Context) : Handler {

    override fun tryToHandle(method: String, args: Map<String, Any>?, result: MethodChannel.Result) {
        when (method) {
            UserPropertiesRoutes.setUserProperty.name -> SetUserPropertyParser(result).parse(args) { key, value, setOnce ->
                setUserProperty(key, value, setOnce, result)
            }

            UserPropertiesRoutes.incrementUserProperty.name -> IncrementUserPropertyParser(result).parse(args) { key, by ->
                incrementUserProperty(key, by, result)
            }
        }
    }

    private fun setUserProperty(key: ApphudUserPropertyKey, value: Any?, setOnce: Boolean, result: MethodChannel.Result) {
        Apphud.setUserProperty(key = key, value = value, setOnce = setOnce)
        result.success(null)
    }

    private fun incrementUserProperty(key: ApphudUserPropertyKey, by: Any, result: MethodChannel.Result) {
        Apphud.incrementUserProperty(key = key, by = by)
        result.success(null)
    }

    class SetUserPropertyParser(val result: MethodChannel.Result) : ApphudUserPropertyKeyParser() {

        fun parse(args: Map<String, Any>?, callback: (key: ApphudUserPropertyKey, value: Any?, setOnce: Boolean) -> Unit) {
            try {
                args ?: throw IllegalArgumentException("key is required argument")
                val keyString = args["key"] as? String
                        ?: throw IllegalArgumentException("key is required argument")

                val key = parseApphudUserPropertyKey(keyString)

                val value = args["value"] as? Any

                val setOnce = args["setOnce"] as? Boolean ?: false

                callback(key, value, setOnce)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }

    class IncrementUserPropertyParser(val result: MethodChannel.Result) : ApphudUserPropertyKeyParser() {

        fun parse(args: Map<String, Any>?, callback: (key: ApphudUserPropertyKey, by: Any) -> Unit) {
            try {
                args ?: throw IllegalArgumentException("key is required argument")
                val keyString = args["key"] as? String
                        ?: throw IllegalArgumentException("key is required argument")

                val key = parseApphudUserPropertyKey(keyString)

                val by = args["by"] as? Any
                        ?: throw IllegalArgumentException("by is required argument")

                callback(key, by)
            } catch (e: IllegalArgumentException) {
                result.error("400", e.message, "")
            }
        }
    }

    open class ApphudUserPropertyKeyParser() {
        fun parseApphudUserPropertyKey(keyString: String): ApphudUserPropertyKey {
            when (keyString) {
                "email" -> return ApphudUserPropertyKey.Email
                "name" -> return ApphudUserPropertyKey.Name
                "phone" -> return ApphudUserPropertyKey.Phone
                "age" -> return ApphudUserPropertyKey.Age
                "gender" -> return ApphudUserPropertyKey.Gender
                "cohort" -> return ApphudUserPropertyKey.Cohort
                else -> return ApphudUserPropertyKey.CustomProperty(keyString)
            }
        }
    }
}

enum class UserPropertiesRoutes {
    setUserProperty,
    incrementUserProperty;

    companion object Mapper {
        fun stringValues(): List<String> {
            return values().map { route -> route.toString() }
        }
    }
}
