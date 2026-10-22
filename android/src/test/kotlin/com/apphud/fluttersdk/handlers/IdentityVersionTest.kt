package com.apphud.fluttersdk.handlers

import com.apphud.sdk.ApphudIdentityVersion
import io.flutter.plugin.common.MethodChannel
import org.junit.Assert.*
import org.junit.Test

class IdentityVersionTest {
    @Test fun defaultsToV1() {
        assertEquals(ApphudIdentityVersion.V1, identityVersionFromArgument(null))
        assertEquals(ApphudIdentityVersion.V1, identityVersionFromArgument("v1"))
    }

    @Test fun forwardsExplicitV2ThroughStartParser() {
        val result = Result()
        var called = false
        InitializationHandler.StartParser(result).parse(
            mapOf("apiKey" to "test-key", "identityVersion" to "v2")
        ) { key, user, observer, baseUrl, version ->
            called = true
            assertEquals("test-key", key)
            assertNull(user)
            assertFalse(observer)
            assertNull(baseUrl)
            assertEquals(ApphudIdentityVersion.V2, version)
        }
        assertTrue(called)
        assertNull(result.code)
    }

    @Test fun invalidVersionDoesNotInvokeInitialization() {
        val result = Result()
        InitializationHandler.StartParser(result).parse(
            mapOf("apiKey" to "test-key", "identityVersion" to 2)
        ) { _, _, _, _, _ -> fail("Must reject malformed channel values") }
        assertEquals("400", result.code)
    }

    @Test fun legacyV1ManualIdsStillForward() {
        val result = Result()
        var called = false
        InitializationHandler.StartManuallyParser(result).parse(
            mapOf("apiKey" to "test-key", "deviceID" to "legacy")
        ) { _, _, device, _, _, version ->
            called = true
            assertEquals("legacy", device)
            assertEquals(ApphudIdentityVersion.V1, version)
        }
        assertTrue(called)
        assertNull(result.code)
    }

    @Test fun refusesHostOwnedIdsInV2() {
        val result = Result()
        InitializationHandler.StartManuallyParser(result).parse(
            mapOf("apiKey" to "test-key", "identityVersion" to "v2", "deviceID" to "host")
        ) { _, _, _, _, _, _ -> fail("V2 IDs must be native-owned") }
        assertEquals("400", result.code)
    }

    private class Result : MethodChannel.Result {
        var code: String? = null
        override fun success(result: Any?) = Unit
        override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
            code = errorCode
        }
        override fun notImplemented() = Unit
    }
}
