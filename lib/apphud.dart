import 'dart:async';

import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/apphud_models/apphud_user_property_key.dart';
import 'package:apphud/models/mapper.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/services.dart';

import 'models/apphud_models/apphud_attribution_provider.dart';
import 'models/apphud_models/composite/apphud_product.dart';
import 'models/apphud_models/composite/apphud_purchase.dart';
import 'models/apphud_models/ios/apphud_purchase_result_ios.dart';
import 'models/extensions.dart';

class AppHud {
  static const MethodChannel _channel = MethodChannel('appHud');

// Initialization

  /// Initializes Apphud SDK. You should call it during app launch.
  ///
  /// - parameter [apiKey] is required. Your api key.
  /// - parameter [userID] is optional. You can provide your own unique user identifier. If null passed then UUID will be generated instead.
  /// - parameter [observerMode] is optional, iOS only. Sets SDK to Observer (i.e. Analytics) mode. If you purchase products by other code, then pass `true`. If you purchase products using `Apphud.purchase(..)` method, then pass `false`. Default value is `false`.
  static Future<void> start({
    required String apiKey,
    String? userID,
    bool? observerMode,
  }) =>
      _channel.invokeMethod('start', {
        'apiKey': apiKey,
        'userID': userID,
        'observerMode': observerMode ?? false,
      });

  /// Initializes Apphud SDK with User ID & Device ID pair. Not recommended for use unless you know what you are doing.
  ///
  /// - parameter [apiKey] is required. Your api key.
  /// - parameter [userID] is optional. You can provide your own unique user identifier. If null passed then UUID will be generated instead.
  /// - parameter [deviceID] is optional. You can provide your own unique device identifier. If null passed then UUID will be generated instead.
  /// - parameter [observerMode] is optional, iOS only. Sets SDK to Observer (Analytics) mode. If you purchase products by your own code, then pass `true`. If you purchase products using `Apphud.purchase(product)` method, then pass `false`. Default value is `false`.
  static Future<void> startManually({
    required String apiKey,
    String? userID,
    String? deviceID,
    bool? observerMode,
  }) =>
      _channel.invokeMethod('startManually', {
        'apiKey': apiKey,
        'deviceID': deviceID,
        'userID': userID,
        'observerMode': observerMode ?? false,
      });

  /// Updates user ID value.
  ///
  /// - parameter [userID] is required. New user ID value.
  static Future<void> updateUserID(String userID) =>
      _channel.invokeMethod('updateUserID', {'userID': userID});

  /// Returns current userID that identifies user across his multiple devices.
  ///
  /// This value may change in runtime.
  static Future<String> userID() async {
    return (await _channel.invokeMethod<String>('userID'))!;
  }

  /// iOS only. Returns current device ID.
  ///
  /// You should use it only if you want to implement custom logout/login flow by saving User ID & Device ID pair for each app user.
  static Future<String> deviceID() async {
    return (await _channel.invokeMethod('deviceID'))!;
  }

  /// Logs out current user, clears all saved data and resets SDK to uninitialized state.
  ///
  /// You will need to call `Apphud.start()` or `Apphud.startManually()` again to initialize SDK with a new user.
  /// This might be useful if you have your custom logout/login flow and you want to take control of each logged-in user's subscription status.
  /// If previous user had active subscription, the new logged-in user can still restore purchases on this device and both users will be merged under the previous paid one, because Apple ID is tied to a device.
  static Future<void> logout() => _channel.invokeMethod('logout');

// Make Purchase

  /// iOS only. This notification is sent when SKProducts are fetched from StoreKit.
  ///
  /// Note that you have to add all product identifiers in Apphud.
  /// You can use `productsDidFetchCallback` callback or observe for `didFetchProductsNotification()`. Use whatever you like most.
  static Future<String> didFetchProductsNotification() async {
    return (await _channel.invokeMethod('didFetchProductsNotification'))!;
  }

  /// This callback is called when SKProducts are fetched from StoreKit (iOS) or Google Play Billing (Android).
  ///
  /// Note that you have to add all product identifiers in Apphud.
  /// You can use `productsDidFetchCallback` (iOS) callback or observe for `didFetchProductsNotification()`. Use whatever you like most.
  static Future<List<ApphudProduct>> productsDidFetchCallback() async {
    final List<Map<dynamic, dynamic>> products = (await _channel
            .invokeMethod<List<dynamic>>('productsDidFetchCallback'))!
        .toMapList;
    return products.map((json) => ApphudProduct.fromJson(json)).toList();
  }

  /// iOS only. Refreshes SKProducts from the App Store.
  ///
  /// You have to add all product identifiers in Apphud.
  /// You shouldn't call this method at app launch, because Apphud SDK automatically fetches products during initialization. Only use this method as a fallback.
  static Future<List<SKProductWrapper>> refreshStoreKitProducts() async {
    List<Map<dynamic, dynamic>> products =
        (await _channel.invokeMethod<List<dynamic>>('refreshStoreKitProducts'))!
            .toMapList;

    return products.map((json) => SKProductWrapper.fromJson(json)).toList();
  }

  /// Returns [ApphudProduct] object by [productIdentifier].
  ///
  /// Note that you have to add this product identifier in Apphud.
  /// Will return `null` if product is not yet fetched from Google Play Billing (Android) or StoreKit (iOS).
  static Future<ApphudProduct?> product(String productIdentifier) async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>(
      'product',
      {'productIdentifier': productIdentifier},
    );

    return json != null ? ApphudProduct.fromJson(json) : null;
  }

  /// Returns array of [ApphudProduct] objects that you added in Apphud.
  ///
  /// Note that this method will return `null` if products are not yet fetched. You should observe for `Apphud.didFetchProductsNotification()` notification (iOS) or use `productsDidFetchCallback` (iOS, Android).
  static Future<List<ApphudProduct>?> products() async {
    List<Map<dynamic, dynamic>>? products =
        (await _channel.invokeMethod<List<dynamic>>('products'))?.toMapList;
    return products?.map((json) => ApphudProduct.fromJson(json)).toList();
  }

  ///  Purchase product and automatically submits App Store Receipt (iOS) or Google Play purchase token (Android) to Apphud.
  ///
  /// iOS:  You are not required to purchase product using Apphud SDK methods. You can purchase subscription or any in-app purchase using your own code. App Store receipt will be sent to Apphud anyway.
  /// - parameter [productId] ir required. Identifier of the product that user wants to purchase.
  /// Returns [ApphudPurchase] object
  static Future<ApphudPurchase> purchase(String productId) async {
    final dynamic? json = await _channel.invokeMethod(
      'purchase',
      {'productId': productId},
    );
    return ApphudPurchase.fromJson(json);
  }

  /// Purchase product and automatically submits App Store Receipt (iOS) or Google Play purchase token (Android) to Apphud.
  ///
  /// This method doesn't wait until Apphud validates receipt from Apple (iOS) or Google Play (Android) and immediately returns result object.
  //  This method may be useful if you don't care about purchases validation in callback.
  /// - parameter [productId] ir required. Identifier of the product that user wants to purchase.
  /// Returns [ApphudPurchase] object
  static Future<ApphudPurchaseResultIos> purchaseWithoutValidation(
      String productId) async {
    final dynamic? json = await _channel.invokeMethod(
      'purchaseWithoutValidation',
      {'productId': productId},
    );
    return ApphudPurchaseResultIos.fromJson(json!);
  }

  /// iOS >=12.2 only. Purchases subscription (promotional) offer and automatically submits App Store Receipt to Apphud.
  ///
  /// This method automatically sends in-app purchase receipt to Apphud, so you don't need to call `submitReceipt` method.
  /// - parameter [productId] is required. This is an [productId] that user wants to purchase.
  /// - parameter [discountID] is required. This is a Identifier String object that you would like to apply.
  /// Returns [ApphudPurchaseResultIos] object.
  static Future<ApphudPurchaseResultIos> purchasePromo({
    required String productId,
    required String discountID,
  }) async {
    final dynamic? json = await _channel.invokeMethod(
      'purchasePromo',
      {
        'productId': productId,
        'discountID': discountID,
      },
    );
    return ApphudPurchaseResultIos.fromJson(json!);
  }

  ///  Displays an offer code redemption sheet.
  static Future<void> presentOfferCodeRedemptionSheet() async {
    await _channel.invokeMethod('presentOfferCodeRedemptionSheet');
  }

// Handle Purchases

  /// Returns true if user has active subscription.
  //
  //  Use this method to determine whether or not to unlock premium functionality to the user.
  static Future<bool> hasActiveSubscription() async {
    return (await _channel.invokeMethod('hasActiveSubscription')) ?? false;
  }

  ///  Returns [ApphudSubscriptionWrapper] subscription object that current user has ever purchased. Subscriptions are cached on device.
  ///
  ///  If returned object is not null, it doesn't mean that subsription is active.
  ///  You should check `Apphud.hasActiveSubscription()` method or `subscription.isActive()` value to determine whether or not to unlock premium functionality to the user.
  ///  If you have more than one subscription group in your app, use `subscriptions()` method and get `isActive` value for your desired subscription.
  static Future<ApphudSubscriptionWrapper?> subscription() async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>('subscription');
    return json != null ? ApphudSubscriptionWrapper.fromJson(json) : null;
  }

  /// Returns an array of all subscriptions that this user has ever purchased. Subscriptions are cached on device.
  ///
  /// Use this method if you have more than one subscription group in your app.
  static Future<List<ApphudSubscriptionWrapper>> subscriptions() async {
    final List<Map<dynamic, dynamic>>? subscriptions =
        (await _channel.invokeMethod<List<dynamic>>('subscriptions'))
            ?.toMapList;
    if (subscriptions != null) {
      return subscriptions
          .map((json) => ApphudSubscriptionWrapper.fromJson(json))
          .toList();
    }
    return List<ApphudSubscriptionWrapper>.of([]);
  }

  ///  Returns an array of all standard in-app purchases (consumables, non-consumables or non-renewing subscriptions) that this user has ever purchased.
  ///
  ///  Purchases are cached on device. This array is sorted by purchase date. Apphud only tracks consumables if they were purchased after integrating Apphud SDK.
  static Future<List<ApphudNonRenewingPurchase>> nonRenewingPurchases() async {
    final List<Map<dynamic, dynamic>>? purchases =
        (await _channel.invokeMethod<List<dynamic>>('nonRenewingPurchases'))
            ?.toMapList;

    if (purchases != null) {
      return purchases
          .map((json) => ApphudNonRenewingPurchase.fromJson(json))
          .toList();
    }
    return List<ApphudNonRenewingPurchase>.of([]);
  }

  /// Returns `true` if current user has purchased standard in-app purchase with given [productIdentifier].
  ///
  /// Returns `false` if this product is refunded or never purchased. Includes consumables, non-consumables or non-renewing subscriptions. Apphud only tracks consumables if they were purchased after integrating Apphud SDK.
  /// Purchases are sorted by purchase date, so it returns Bool value for the most recent purchase by given product identifier.
  static Future<bool> isNonRenewingPurchaseActive(
    String productIdentifier,
  ) async {
    return (await _channel.invokeMethod<bool>(
          'isNonRenewingPurchaseActive',
          {'productIdentifier': productIdentifier},
        )) ??
        false;
  }

  /// iOS only. Basically the same as restoring purchases.
  static Future<ApphudComposite> validateReceipt() async {
    final Map<dynamic, dynamic> json = (await _channel
        .invokeMethod<Map<dynamic, dynamic>>('validateReceipt'))!;

    return ApphudComposite.fromJson(json);
  }

  /// iOS only. Implements `Restore Purchases` mechanism. Basically it just sends current App Store Receipt to Apphud and returns subscriptions info.
  ///
  /// Even if callback returns some subscription, it doesn't mean that subscription is active. You should check `subscription.isActive()` value.
  /// Returns [ApphudComposite] contain array of subscription (or subscriptions in case you have more than one subscription group), array of standard in-app purchases.
  static Future<ApphudComposite> restorePurchases() async {
    final Map<dynamic, dynamic> json = (await _channel
        .invokeMethod<Map<dynamic, dynamic>>('restorePurchases'))!;

    return ApphudComposite.fromJson(json);
  }

  /// Android only. This method will send all the purchases to the Apphud server.
  ///
  /// Call this when using your own implementation for subscriptions anytime a sync is needed, like after a successful purchase.
  static Future<void> syncPurchases() async {
    await _channel.invokeMethod('syncPurchases');
  }

  /// iOS only. If you already have a live app with paying users and you want Apphud to track their purchases, you should import their App Store receipts into Apphud. Call this method at launch of your app for your paying users. This method should be used only to migrate existing paying users that are not yet tracked by Apphud.
  ///
  /// Example:
  ///
  /// ```dart
  /// // hasPurchases - is your own `bool` value indicating that current user is paying user.
  /// if (hasPurchases) {
  ///     final ApphudComposite apphudComposite = await Apphud.migratePurchasesIfNeeded();
  /// }
  /// ```
  ///
  /// You can remove this method after a some period of time, i.e. when you are sure that all paying users are already synced with Apphud.
  static Future<ApphudComposite> migratePurchasesIfNeeded() async {
    final Map<dynamic, dynamic> json = (await _channel
        .invokeMethod<Map<dynamic, dynamic>>('migratePurchasesIfNeeded'))!;

    return ApphudComposite.fromJson(json);
  }

  /// iOS only. Returns base64 encoded App Store receipt string, if available.
  static Future<String?> appStoreReceipt() async {
    return (await _channel.invokeMethod('appStoreReceipt'))!;
  }

  /// iOS only. Fetches raw receipt info. This might be useful to get `original_application_version` value.
  static Future<Map<String, dynamic>?> fetchRawReceiptInfo() async {
    final Map<dynamic, dynamic>? json = await _channel.invokeMethod(
      'fetchRawReceiptInfo',
    );
    return json != null ? Map<String, dynamic>.from(json) : null;
  }

// User Properties

  /// Set custom user property. Value must be one of: `int`, `float`, `bool`, `String`, `null`.

  /// Example:
  /// ```dart
  /// // use built-in property key
  /// Apphud.setUserProperty(key: ApphudUserPropertyKey.email, value: 'user4@example.com', setOnce: true)
  /// // use custom property key
  /// Apphud.setUserProperty(key: ApphudUserPropertyKey.customProperty('custom_test_property_1'), value: 0.5)
  /// ```
  ///
  /// You can use several built-in keys with their value types:
  /// `ApphudUserPropertyKey.email`: User email. Value must be String.
  /// `ApphudUserPropertyKey.name`: User name. Value must be String.
  /// `ApphudUserPropertyKey.phone`: User phone number. Value must be String.
  /// `ApphudUserPropertyKey.age`: User age. Value must be Int.
  /// `ApphudUserPropertyKey.gender`: User gender. Value must be one of: 'male', 'female', 'other'.
  /// `ApphudUserPropertyKey.cohort`: User install cohort. Value must be String.
  ///
  /// - parameter [key] is required. Initialize class with custom string or using built-in keys. See example above.
  /// - parameter [value] is required/optional. Pass `null` to remove given property from Apphud.
  /// - parameter [setOnce] is optional. Pass `true` to make this property non-updatable.
  static Future<void> setUserProperty({
    required ApphudUserPropertyKey key,
    dynamic? value,
    bool setOnce = false,
  }) async {
    await _channel.invokeMethod(
      'setUserProperty',
      {
        'key': key.keyName,
        'value': value,
        'setOnce': setOnce,
      },
    );
  }

  /// Increment custom user property. Value must be one of: `int`, `float`
  ///
  /// Example:
  /// ```dart
  /// Apphud.incrementUserProperty(key: ApphudUserPropertyKey.customProperty('progress'), by: 0.5)
  /// ```
  /// - parameter [key] is required. Use your custom string key or some of built-in keys.
  /// - parameter by is required. You can pass negative value to decrement.
  static Future<void> incrementUserProperty({
    required ApphudUserPropertyKey key,
    required dynamic by,
  }) async {
    await _channel.invokeMethod(
      'incrementUserProperty',
      {
        'key': key.keyName,
        'by': by,
      },
    );
  }

// Attribution

  /// iOS only. Submit Advertising Identifier (IDFA) to Apphud.
  ///
  /// This is used to properly match user with attribution platforms (AppsFlyer, Facebook, etc.)
  static Future<void> setAdvertisingIdentifier(String idfa) async {
    await _channel.invokeMethod(
      'setAdvertisingIdentifier',
      {'idfa': idfa},
    );
  }

  /// iOS only. Opt out of IDFA collection.
  ///
  /// Currently we collect IDFA to match users between Apphud and attribution platforms (AppsFlyer, Branch). If you don't use and not planning to use such services, you can call this method.
  /// This method must be called before Apphud SDK initialization.
  static Future<void> disableIDFACollection() async {
    await _channel.invokeMethod('disableIDFACollection');
  }

  ///  Submit attribution data to Apphud from your attribution network provider.
  ///
  /// - parameter [data] is required. Attribution 'map'.
  /// - parameter [provider] is required. Attribution provider name. Available values: `ApphudAttributionProvider.appsFlyer`, `ApphudAttributionProvider.adjust`, `ApphudAttributionProvider.appleSearchAds`, `ApphudAttributionProvider.facebook`.
  /// - parameter [identifier] is optional. Identifier that matches Apphud and Attrubution provider. Required for AppsFlyer.
  /// Returns true if successfully sent.
  static Future<bool> addAttribution({
    required Map<String, dynamic> data,
    required ApphudAttributionProvider provider,
    String? identifier,
  }) async {
    final bool isAdded = await _channel.invokeMethod('addAttribution', {
      'data': data,
      'from': provider.convertToString,
      'identifer': identifier
    });
    return isAdded;
  }

  /// Android only. Disables Ad tracking.
  static Future<void> disableAdTracking() =>
      _channel.invokeMethod('disableAdTracking');

// Other

  /// Enables debug logs. You should call this method before SDK initialization.
  static Future<void> enableDebugLogs() =>
      _channel.invokeMethod('enableDebugLogs');

  ///  iOS only. Returns `true` if current build is running on simulator or Debug/TestFlight modes. Returns `false` if current build is App Store build.
  static Future<bool> isSandbox() async {
    final bool? value = await _channel.invokeMethod<bool>('isSandbox');
    assert(value != null, 'Error getting isSandbox, value = null');
    return value!;
  }
}
