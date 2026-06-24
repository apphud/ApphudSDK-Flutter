package com.apphud.demo

import android.content.Intent
import android.os.Bundle
import com.apphud.sdk.Apphud
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Forward the launch intent so Apphud can process direct deep links
        // that opened the app from a cold start.
        Apphud.handleIntent(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        // Forward deep links that arrive while the app is already running.
        Apphud.handleIntent(intent)
    }
}
