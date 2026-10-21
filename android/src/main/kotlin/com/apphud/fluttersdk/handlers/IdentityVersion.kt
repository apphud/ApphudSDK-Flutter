package com.apphud.fluttersdk.handlers

import com.apphud.sdk.ApphudIdentityVersion

internal fun identityVersionFromArgument(value: Any?): ApphudIdentityVersion = when (value) {
    null, "v1" -> ApphudIdentityVersion.V1
    "v2" -> ApphudIdentityVersion.V2
    else -> throw IllegalArgumentException("identityVersion must be v1 or v2")
}
