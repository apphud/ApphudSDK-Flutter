package com.apphud.fluttersdk

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import com.apphud.fluttersdk.handlers.*

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** AppHudPlugin */
class AppHudPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    lateinit var handlers: List<Handler>

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    private lateinit var context: Context
    private var activity: Activity? = null

    private lateinit var channel: MethodChannel

    override
    fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "appHud")
        channel.setMethodCallHandler(this)
        this.context = flutterPluginBinding.applicationContext
    }


    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        handlers.forEach { handler ->
            if (handler.isAbleToHandle(call.method)) handler.tryToHandle(
                    method = call.method,
                    args = call.arguments as? Map<String, Any>,
                    result = result)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity

        val sActivity = activity ?: return

        handlers = listOf(
                InitializationHandler(InitializationRoutes.stringValues(), context = this.context),
                MakePurchaseHandler(MakePurchaseRoutes.stringValues(), activity = sActivity),
                HandlePurchasesHandler(HandlePurchasesRoutes.stringValues(), context = this.context),
                AttributionHandler(AttributionRoutes.stringValues()),
                OtherHandler(OtherRoutes.stringValues(), context = this.context),
                UserPropertiesHandler(UserPropertiesRoutes.stringValues(), context = this.context),
                PaywallLogsHandler(PaywallLogsRoutes.stringValues(), context = this.context)
        )
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }
}
