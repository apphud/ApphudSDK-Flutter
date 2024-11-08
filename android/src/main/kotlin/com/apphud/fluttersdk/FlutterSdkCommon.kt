package com.apphud.fluttersdk

import com.apphud.sdk.Apphud
import com.apphud.sdk.domain.ApphudPaywall
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlin.coroutines.resume
import kotlin.coroutines.suspendCoroutine

object FlutterSdkCommon {
    public suspend fun getPaywall(
        paywallIdentifier: String?,
        placementIdentifier: String?
    ): ApphudPaywall? {
        return if (placementIdentifier != null) {
            val placements = Apphud.placements()
            placements.firstOrNull { it.identifier == placementIdentifier }?.paywall
        } else if (paywallIdentifier != null) {
            suspendCancellableCoroutine { cont ->
                Apphud.paywallsDidLoadCallback { paywalls, _ ->
                    val paywall = paywalls.firstOrNull { it.identifier == paywallIdentifier }
                    cont.resume(paywall)
                }
            }
        } else null
    }
}