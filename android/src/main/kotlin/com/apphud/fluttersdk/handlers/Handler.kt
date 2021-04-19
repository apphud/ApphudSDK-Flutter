package com.apphud.fluttersdk.handlers

import io.flutter.plugin.common.MethodChannel

interface Handler {
    val routes: List<String>
    fun tryToHandle(method: String, args: Map<String, Any>?, result: MethodChannel.Result)
    fun isAbleToHandle(method: String): Boolean {
        return routes.contains(method)
    }
}