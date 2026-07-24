package com.apphud.fluttersdk

import android.app.Activity
import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import com.apphud.fluttersdk.handlers.*
import com.apphud.sdk.internal.data.network.SdkHeaders
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

    // Per-binding instance state. We intentionally do NOT store any of these
    // in a `companion object` / static field: each FlutterPluginBinding gets
    // its own MethodChannel + handlers list. Sharing state across bindings via
    // statics caused the new plugin instance to never re-register itself as
    // the channel handler after engine detach/re-attach, producing
    // `MissingPluginException(No implementation found for method X on channel apphud)`.

    private var channel: MethodChannel? = null
    private var listenerChannel: MethodChannel? = null
    private var listenerHandler: ApphudListenerHandler? = null
    private var ruleListenerChannel: MethodChannel? = null
    private var deeplinkChannel: MethodChannel? = null
    private var deeplinkBridge: ApphudDeeplinkBridge? = null

    private lateinit var context: Context
    private var activity: Activity? = null

    // Handlers are initialized in onAttachedToEngine (NOT onAttachedToActivity)
    // so that method calls arriving before / between activity attaches don't
    // hit an uninitialized list.
    private var handlers: List<Handler> = emptyList()
    private var makePurchaseHandler: MakePurchaseHandler? = null

    private var nativeSdkVersion: String = SdkHeaders.X_SDK_VERSION

    private val handleOnMainThread: HandleOnMainThread = { func ->
        CoroutineScope(Dispatchers.Main).launch {
            try {
                func()
            } catch (e: IllegalStateException) {
                Log.e("Apphud", e.toString(), e)
            }
        }
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        this.context = flutterPluginBinding.applicationContext

        // Always (re)create the channel for this binding's binaryMessenger and
        // (re)register `this` as the handler. Doing this unconditionally fixes
        // the case where a previous instance left a stale channel/handler
        // pointing at a detached engine.
        channel?.setMethodCallHandler(null)
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "apphud").also {
            it.setMethodCallHandler(this)
        }

        listenerChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "apphud/listener")
        listenerHandler?.setMethodCallHandler(null)
        listenerHandler = ApphudListenerHandler(handleOnMainThread).also {
            it.setMethodCallHandler(listenerChannel)
        }

        ruleListenerChannel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "apphud/rule_listener"
        )
        ApphudRuleCallbackHandler.bind(ruleListenerChannel!!, handleOnMainThread)

        deeplinkChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "apphud/deeplink")
        deeplinkBridge?.setMethodCallHandler(null)
        deeplinkBridge = ApphudDeeplinkBridge(handleOnMainThread).also {
            it.activity = activity
            it.setMethodCallHandler(deeplinkChannel)
        }

        setHeaders()
        buildHandlers()
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        @Suppress("UNCHECKED_CAST")
        val args = call.arguments as? Map<String, Any>
        for (handler in handlers) {
            if (handler.isAbleToHandle(call.method)) {
                handler.tryToHandle(method = call.method, args = args, result = result)
                return
            }
        }
        result.notImplemented()
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        channel = null
        listenerHandler?.setMethodCallHandler(null)
        listenerHandler = null
        listenerChannel = null
        ApphudRuleCallbackHandler.unbind()
        ruleListenerChannel = null
        deeplinkBridge?.setMethodCallHandler(null)
        deeplinkBridge = null
        deeplinkChannel = null
        handlers = emptyList()
        makePurchaseHandler = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        makePurchaseHandler?.activity = binding.activity
        ApphudRuleCallbackHandler.activity = binding.activity
        deeplinkBridge?.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
        makePurchaseHandler?.activity = null
        ApphudRuleCallbackHandler.activity = null
        deeplinkBridge?.activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        makePurchaseHandler?.activity = binding.activity
        ApphudRuleCallbackHandler.activity = binding.activity
        deeplinkBridge?.activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
        makePurchaseHandler?.activity = null
        ApphudRuleCallbackHandler.activity = null
        deeplinkBridge?.activity = null
    }

    private fun buildHandlers() {
        val purchaseHandler = MakePurchaseHandler(
            MakePurchaseRoutes.stringValues(),
            handleOnMainThread
        ).also { it.activity = activity }
        makePurchaseHandler = purchaseHandler

        handlers = listOf(
            InitializationHandler(
                InitializationRoutes.stringValues(),
                context = this.context,
                handleOnMainThread
            ),
            purchaseHandler,
            HandlePurchasesHandler(
                HandlePurchasesRoutes.stringValues(),
                handleOnMainThread
            ),
            AttributionHandler(AttributionRoutes.stringValues(), handleOnMainThread),
            OtherHandler(OtherRoutes.stringValues(), handleOnMainThread),
            UserPropertiesHandler(
                UserPropertiesRoutes.stringValues(),
                handleOnMainThread
            ),
            PaywallLogsHandler(
                PaywallLogsRoutes.stringValues(),
                handleOnMainThread
            ),
            PromotionalsHandler(PromotionalsRoutes.stringValues(), handleOnMainThread),
            PlacementsHandler(handleOnMainThread),
            RulesHandler(RulesRoutes.stringValues(), handleOnMainThread),
        )
    }

    private fun setHeaders() {
        SdkHeaders.X_SDK = "Flutter"
        if (!SdkHeaders.X_SDK_VERSION.contains("(")) {
            SdkHeaders.X_SDK_VERSION = BuildConfig.FLUTTER_PLUGIN_VERSION + "(${nativeSdkVersion})"
        }
    }
}
