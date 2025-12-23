package com.apphud.fluttersdk

import android.app.Activity
import android.content.Context
import android.os.Build
import android.os.Looper
import android.util.Log
import androidx.annotation.NonNull
import com.apphud.fluttersdk.handlers.*
import com.apphud.sdk.ApphudUtils
import com.apphud.sdk.internal.data.network.SdkHeaders
import io.flutter.BuildConfig
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

/** AppHudPlugin */
class ApphudPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var handlers: List<Handler>

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    private lateinit var context: Context

    private var nativeSdkVersion: String = SdkHeaders.X_SDK_VERSION
    private var activity: Activity? = null

    private var handleOnMainThread: HandleOnMainThread = { func ->
        CoroutineScope(Dispatchers.Main).launch {
        try {
                func()
            } catch (e: IllegalStateException) {
                Log.e("Apphud", e.toString(), e)
            }
        }
    }


    companion object {
        @JvmStatic
        private var listenerHandler: ApphudListenerHandler? = null

        @JvmStatic
        private var channel: MethodChannel? = null

        @JvmStatic
        private var listenerChannel: MethodChannel? = null
    }


    override
    fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel ?: run {
            channel = MethodChannel(flutterPluginBinding.binaryMessenger, "apphud")
            channel!!.setMethodCallHandler(this)
        }
        listenerChannel ?: run {
            listenerChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "apphud/listener")
        }
        listenerHandler ?: run {
            listenerHandler = ApphudListenerHandler(handleOnMainThread)
            listenerHandler!!.setMethodCallHandler(listenerChannel)
        }
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
        channel?.setMethodCallHandler(null)
        channel = null
        listenerHandler?.setMethodCallHandler(null)
        listenerHandler = null
        listenerChannel = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity

        val sActivity = activity ?: return

        setHeaders()

        handlers = listOf(
            InitializationHandler(
                InitializationRoutes.stringValues(),
                context = this.context,
                handleOnMainThread
            ),
            MakePurchaseHandler(
                MakePurchaseRoutes.stringValues(),
                activity = sActivity,
                handleOnMainThread
            ),
            HandlePurchasesHandler(
                HandlePurchasesRoutes.stringValues(),
                handleOnMainThread
            ),
            AttributionHandler(AttributionRoutes.stringValues(), handleOnMainThread),
            OtherHandler(OtherRoutes.stringValues(),handleOnMainThread),
            UserPropertiesHandler(
                UserPropertiesRoutes.stringValues(),
                handleOnMainThread
            ),
            PaywallLogsHandler(
                PaywallLogsRoutes.stringValues(),
                handleOnMainThread
            ),
            PromotionalsHandler(PromotionalsRoutes.stringValues(), handleOnMainThread),
            PlacementsHandler(handleOnMainThread)
        )
    }

    private fun setHeaders() {
        SdkHeaders.X_SDK = "Flutter"
        if (!SdkHeaders.X_SDK_VERSION.contains("(")) {
            SdkHeaders.X_SDK_VERSION = "3.0.1" + "(${nativeSdkVersion})"
        }
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
