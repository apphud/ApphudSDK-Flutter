package com.apphud.fluttersdk

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import com.apphud.fluttersdk.handlers.*
import com.apphud.sdk.managers.HeadersInterceptor

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** AppHudPlugin */
class ApphudPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var handlers: List<Handler>

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    private lateinit var context: Context
    private var activity: Activity? = null

    private lateinit var channel: MethodChannel
    private lateinit var listenerChannel: MethodChannel
    private lateinit var listenerHandler: ApphudListenerHandler

    override
    fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "apphud")
        channel.setMethodCallHandler(this)
        listenerChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "apphud/listener")
        listenerHandler = ApphudListenerHandler(listenerChannel)
        this.context = flutterPluginBinding.applicationContext
    }


    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        handlers.forEach { handler ->
            if (handler.isAbleToHandle(call.method)) handler.tryToHandle(
                method = call.method,
                args = call.arguments as? Map<String, Any>,
                result = result
            )
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        listenerHandler.dispose()
        listenerHandler
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity

        val sActivity = activity ?: return

        setHeaders()

        handlers = listOf(
            InitializationHandler(InitializationRoutes.stringValues(), context = this.context),
            MakePurchaseHandler(MakePurchaseRoutes.stringValues(), activity = sActivity),
            HandlePurchasesHandler(HandlePurchasesRoutes.stringValues(), context = this.context),
            AttributionHandler(AttributionRoutes.stringValues()),
            OtherHandler(OtherRoutes.stringValues(), context = this.context),
            UserPropertiesHandler(UserPropertiesRoutes.stringValues(), context = this.context),
            PaywallLogsHandler(PaywallLogsRoutes.stringValues(), context = this.context),
            PromotionalsHandler(PromotionalsRoutes.stringValues())
        )
    }

    private fun setHeaders() {
        HeadersInterceptor.X_SDK = "Flutter"
        HeadersInterceptor.X_SDK_VERSION = BuildConfig.APPHUD_FLUTTER_SDK_VERSION
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
