# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Gson specific classes
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**

-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Prevent R8 from leaving Data object members always null
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

# Keep essential classes
-keep class io.flutter.** { *; } # Keep Flutter classes
-keep class com.apphud.sdk.** { *; } # Keep your package's classes
-keep class com.apphud.fluttersdk.** { *; } # Keep your package's classes

# Keep native methods
-keepclassmembers class com.apphud.sdk.** { native <methods>; } # Keep native methods
-keepclassmembers class com.apphud.fluttersdk.** { native <methods>; } # Keep native methods

# Keep Android Billing Client classes
-keep class com.android.billingclient.api.** { *; }

# Keep enum classes and their methods (important for status enums)
-keepclassmembers enum * { *; }