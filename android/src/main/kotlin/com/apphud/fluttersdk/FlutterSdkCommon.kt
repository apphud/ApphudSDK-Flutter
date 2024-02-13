package com.apphud.fluttersdk

import com.apphud.sdk.Apphud
import com.apphud.sdk.domain.ApphudPaywall


object FlutterSdkCommon {
    public suspend fun getPaywall(
        paywallIdentifier: String?,
        placementIdentifier: String?
    ): ApphudPaywall? {
        val foundPaywall: ApphudPaywall? = if (placementIdentifier != null) {
            val placements = Apphud.placements()
            placements.firstOrNull { it.identifier == placementIdentifier }?.paywall
        } else if (paywallIdentifier != null) {
            val paywalls = Apphud.paywalls()
            paywalls.firstOrNull { it.identifier == paywallIdentifier }
        } else null
        return foundPaywall
    }
}