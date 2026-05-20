package com.apphud.fluttersdk

import com.apphud.sdk.Apphud
import com.apphud.sdk.domain.ApphudPaywall

object FlutterSdkCommon {
    public suspend fun getPaywall(
        paywallIdentifier: String?,
        placementIdentifier: String?
    ): ApphudPaywall? {

        val placements = Apphud.placements()

        return if (placementIdentifier != null) {
            placements.firstOrNull { it.identifier == placementIdentifier }?.paywall
        } else if (paywallIdentifier != null) {
            placements.firstOrNull { it.paywall?.identifier == paywallIdentifier }?.paywall
        } else null
    }
}