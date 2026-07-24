package com.apphud.demo

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.apphud.sdk.Apphud
import com.google.firebase.messaging.FirebaseMessaging
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Forward the launch intent so Apphud can process direct deep links
        // that opened the app from a cold start.
        Apphud.handleIntent(intent)
        requestNotificationPermissionIfNeeded()
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        // Forward deep links that arrive while the app is already running.
        Apphud.handleIntent(intent)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            FCM_CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "submitCurrentToken" -> {
                    submitCurrentFcmToken(result)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun submitCurrentFcmToken(result: MethodChannel.Result) {
        FirebaseMessaging.getInstance().token
            .addOnCompleteListener { task ->
                if (!task.isSuccessful) {
                    Log.e(TAG, "Fetching FCM token failed", task.exception)
                    result.success(false)
                    return@addOnCompleteListener
                }
                val token = task.result
                Log.d(TAG, "FCM token: $token")
                Apphud.submitPushNotificationsToken(token) { success ->
                    Log.d(TAG, "submitPushNotificationsToken success=$success")
                    result.success(success)
                }
            }
    }

    private fun requestNotificationPermissionIfNeeded() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS)
            == PackageManager.PERMISSION_GRANTED
        ) {
            return
        }
        ActivityCompat.requestPermissions(
            this,
            arrayOf(Manifest.permission.POST_NOTIFICATIONS),
            REQUEST_POST_NOTIFICATIONS
        )
    }

    private companion object {
        const val TAG = "ApphudExample"
        const val FCM_CHANNEL = "com.apphud.demo/fcm"
        const val REQUEST_POST_NOTIFICATIONS = 1001
    }
}
