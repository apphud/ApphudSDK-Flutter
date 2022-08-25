import 'dart:async';

import 'package:apphud/listener/apphud_listener.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:apphud/models/apphud_models/apphud_debug_level.dart';
import 'package:apphud/models/apphud_models/apphud_group.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/apphud_models/apphud_user_property_key.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/services.dart';

import 'listener/apphud_listener_handler.dart';
import 'models/apphud_models/apphud_attribution_provider.dart';
import 'models/apphud_models/apphud_error.dart';
import 'models/apphud_models/composite/apphud_product_composite.dart';
import 'models/apphud_models/composite/apphud_purchase_result.dart';
import 'models/extensions.dart';
export 'listener/apphud_listener.dart';

class Apphud {
  static const MethodChannel _channel = MethodChannel('apphud');
  static const MethodChannel _listenerChannel =
      MethodChannel('apphud/listener');
  static ApphudListenerHandler? _apphudListenerHandler;

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
  /// Note that it should be called only after user is registered, i.e.
  /// inside ApphudListener's userDidRegister method.
  /// - parameter [userID] is required. New user ID value.
  static Future<void> updateUserID(String userID) =>
      _channel.invokeMethod('updateUserID', {'userID': userID});

  /// Returns current userID that identifies user across his multiple devices.
  ///
  /// This value may change in runtime.
  static Future<String> userID() async {
    return (await _channel.invokeMethod<String>('userID'))!;
  }

  /// Returns current device ID.
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

  /// Set listener
  ///
  /// - parameter [listener] is optional. When the parameter is null or omitted,
  // the previous set listener will be removed. The only one listener
  // may be used at the same time, so the new listener replaces the previous.
  static Future<void> setListener({ApphudListener? listener}) async {
    _apphudListenerHandler?.dispose();
    _apphudListenerHandler = null;
    if (listener != null) {
      _apphudListenerHandler = ApphudListenerHandler(
        channel: _listenerChannel,
        listener: listener,
      );
    }
  }

// Make Purchase

  /// iOS only. This notification is sent when `SKProduct`s are fetched from the App Store.
  ///
  /// Note that you have to add all product identifiers in Apphud Dashboard > Product Hub > Products.
  /// You can use `productsDidFetchCallback` callback or observe for `didFetchProductsNotification()`
  /// or implement `apphudDidFetchProducts` 'ApphudListener' method. Use whatever you like most.
  /// Best practise is not to use this method, but implement paywalls logic by adding your
  /// paywall configuration in Apphud Dashboard > Product Hub > Paywalls.
  @Deprecated('Use `setListener({ApphudListener? listener})` method instead.')
  static Future<String> didFetchProductsNotification() async {
    return (await _channel.invokeMethod('didFetchProductsNotification'))!;
  }

  /// This callback is called when SKProducts are fetched from StoreKit (iOS) or Google Play Billing (Android).
  ///
  /// Note that you have to add all product identifiers in Apphud.
  static Future<List<ApphudProductComposite>> productsDidFetchCallback() async {
    final List<Map<dynamic, dynamic>> products = (await _channel
            .invokeMethod<List<dynamic>>('productsDidFetchCallback'))!
        .toMapList;
    return products
        .map((json) => ApphudProductComposite.fromJson(json))
        .toList();
  }

  /// iOS only.  Refreshes `SKProduct`s from the App Store.
  ///
  /// You have to add all product identifiers in Apphud Dashboard > Product Hub > Products.
  /// You shouldn't call this method at app launch, because Apphud SDK automatically
  /// fetches products during initialization. Only use this method as a fallback.
  /// Best practise is not to use this method, but implement paywalls logic by adding your
  /// paywall configuration in Apphud Dashboard > Product Hub > Paywalls.
  static Future<List<SKProductWrapper>> refreshStoreKitProducts() async {
    List<Map<dynamic, dynamic>> products =
        (await _channel.invokeMethod<List<dynamic>>('refreshStoreKitProducts'))!
            .toMapList;

    return products.map((json) => SKProductWrapper.fromJson(json)).toList();
  }

  /// Returns [ApphudProductComposite] object by [productIdentifier].
  ///
  /// Note that you have to add this product identifier in Apphud Dashboard > Product Hub > Products.
  /// Will return `null` if product is not yet fetched from the App Store.
  /// Best practise is not to use this method, but implement paywalls logic by adding your
  /// paywall configuration in Apphud Dashboard > Product Hub > Paywalls.
  static Future<ApphudProductComposite?> product(
      String productIdentifier) async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>(
      'product',
      {'productIdentifier': productIdentifier},
    );

    return json != null ? ApphudProductComposite.fromJson(json) : null;
  }

  /// Returns array of [ApphudProductComposite] objects that you added in Apphud > Product Hub > Products.
  ///
  /// Note that this method will return `null` if products are not yet fetched from the App Store.
  /// You should observe for `didFetchProductsNotification()` notification on iOS or implement
  /// `apphudFetchProducts` method of 'ApphudListener' or use `productsDidFetchCallback`.
  /// Best practise is not to use this method, but implement paywalls logic by adding your
  /// paywall configuration in Apphud Dashboard > Product Hub > Paywalls.
  static Future<List<ApphudProductComposite>?> products() async {
    List<Map<dynamic, dynamic>>? products =
        (await _channel.invokeMethod<List<dynamic>>('products'))?.toMapList;
    return products
        ?.map((json) => ApphudProductComposite.fromJson(json))
        .toList();
  }

  ///  Purchase product and automatically submits App Store Receipt (iOS) or Google Play purchase token (Android) to Apphud.
  ///
  /// - parameter [productId] is identifier of the product that user wants to purchase. If you don't use Apphud paywalls, you can use this parameter.
  /// Best practise is not to use this method, but implement paywalls logic by adding your paywall configuration in Apphud Dashboard > Product Hub > Paywalls.
  /// - parameter [product] - is an `ApphudProduct` object from your `ApphudPaywall`. You must first configure paywalls in Apphud Dashboard > Product Hub > Paywalls.
  /// Returns [ApphudPurchaseResult] object
  /// Note for iOS only:  You are not required to purchase product using Apphud SDK methods.
  /// You can purchase subscription or any in-app purchase using your own code. App Store receipt will be sent to Apphud anyway.
  static Future<ApphudPurchaseResult> purchase({
    String? productId,
    ApphudProduct? product,
  }) async {
    try {
      assert(
        !(productId == null && product == null),
        'Both productId and product can not be null at the same time',
      );
      assert(
        !(productId != null && product != null),
        'Both productId and product can not be non null at the same time',
      );
      dynamic json;
      if (productId != null) {
        json = await _channel.invokeMethod(
          'purchase',
          {'productId': productId},
        );
      } else if (product != null) {
        json = await _channel.invokeMethod(
          'purchaseProduct',
          product.toJson()
            ..remove('skuDetails')
            ..remove('skProduct'),
        );
      }
      return ApphudPurchaseResult.fromJson(json);
    } catch (e) {
      return ApphudPurchaseResult(error: ApphudError(message: e.toString()));
    }
  }

  /// Purchase product and automatically submits App Store Receipt (iOS) or Google Play purchase token (Android) to Apphud.
  ///
  /// This method doesn't wait until Apphud validates receipt from Apple (iOS) or Google Play (Android) and immediately returns result object.
  //  This method may be useful if you don't care about purchases validation in callback.
  /// - parameter [productId] ir required. Identifier of the product that user wants to purchase.
  /// Returns [ApphudPurchaseResult] object
  static Future<ApphudPurchaseResult> purchaseWithoutValidation(
      String productId) async {
    final dynamic json = await _channel.invokeMethod(
      'purchaseWithoutValidation',
      {'productId': productId},
    );
    return ApphudPurchaseResult.fromJson(json!);
  }

  /// iOS >=12.2 only. Purchases subscription (promotional) offer and automatically submits App Store Receipt to Apphud.
  ///
  /// This method automatically sends in-app purchase receipt to Apphud, so you don't need to call `submitReceipt` method.
  /// - parameter [productId] is required. This is an [productId] that user wants to purchase.
  /// - parameter [discountID] is required. This is a Identifier String object that you would like to apply.
  /// Returns [ApphudPurchaseResult] object.
  static Future<ApphudPurchaseResult> purchasePromo({
    required String productId,
    required String discountID,
  }) async {
    final dynamic json = await _channel.invokeMethod(
      'purchasePromo',
      {
        'productId': productId,
        'discountID': discountID,
      },
    );
    return ApphudPurchaseResult.fromJson(json!);
  }

  ///  Displays an offer code redemption sheet.
  static Future<void> presentOfferCodeRedemptionSheet() async {
    await _channel.invokeMethod('presentOfferCodeRedemptionSheet');
  }

  /// Returns paywalls configured in Apphud Dashboard > Product Hub > Paywalls.
  ///
  /// Each paywall contains an array of `ApphudProduct` objects that you use for purchase.
  /// `ApphudProduct` is Apphud's wrapper around `SkuDetails` or 'SkProduct'.
  /// Returns empty array if paywalls are not yet fetched.
  /// To get notified when paywalls are ready to use, use ApphudListener's  `userDidLoad` or `paywallsDidFullyLoad` methods.
  /// Best practice is to use this method together with `paywallsDidFullyLoad` listener.
  static Future<ApphudPaywalls?> paywalls() async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>('paywalls');
    return json != null ? ApphudPaywalls.fromJson(json) : null;
  }

  /// iOS only. If you want to use A/B experiments while running SDK in `Observer Mode` you should manually send paywall identifier to Apphud using this method.
  ///
  /// Note that you have to add paywalls in Apphud Dashboard > Product Hub > Paywalls.
  /// You must call this method right after your own purchase method.
  static Future<void> didPurchaseFromPaywall(String paywallIdentifier) async {
    await _channel.invokeMethod(
      'didPurchaseFromPaywall',
      {'paywallIdentifier': paywallIdentifier},
    );
  }

  /// Android only. Refreshes current purchases: subscriptions and non-renewing purchases.
  ///
  /// To get notified about updates, you should listen for ApphudListener's
  /// apphudSubscriptionsUpdated() and apphudNonRenewingPurchasesUpdated() methods.
  /// Best practice is to use this method when your app reactivates from a background.
  /// i.e. second app open during lifecycle.
  static Future<void> refreshEntitlements() async {
    await _channel.invokeMethod('refreshEntitlements');
  }

// Handle Purchases

  /// Returns permission groups configured in Apphud dashboard > Product Hub > Products. Groups are cached on device.
  ///
  /// Note that this method returns empty array if `SkuDetails` or 'SkProduct' are not yet fetched from Google Play / App Store.
  /// To get notified when `permissionGroups` are ready to use, use ApphudListener's `paywallsDidFullyLoad` method
  /// Best practice is not to use this method at all, but use `paywalls()` instead.
  static Future<List<ApphudGroup>> permissionGroups() async {
    List<Map<dynamic, dynamic>> groups =
        (await _channel.invokeMethod<List<dynamic>>('permissionGroups'))!
            .toMapList;
    return groups.map((json) => ApphudGroup.fromJson(json)).toList();
  }

  /// Returns `true` if user has active subscription. Value is cached on device.
  ///
  /// Use this method to determine whether or not user has active premium subscription.
  /// Note that if you have lifetime purchases, you must use another `isNonRenewingPurchaseActive` method.
  static Future<bool> hasActiveSubscription() async {
    return (await _channel.invokeMethod('hasActiveSubscription')) ?? false;
  }

  /// Returns `true` if user has active subscription or non renewing purchase (lifetime).
  ///
  /// You should not use this method if you have consumable in-app purchases, like coin packs.
  /// Use this method to determine whether or not user has active premium access.
  /// If you have consumable purchases, this method won't operate correctly,
  /// because Apphud SDK doesn't differ consumables from non-consumables.

  static Future<bool> hasPremiumAccess() async {
    return (await _channel.invokeMethod('hasPremiumAccess')) ?? false;
  }

  ///  Returns [ApphudSubscriptionWrapper] subscription object that current user has ever purchased. Subscriptions are cached on device.
  ///
  ///  If returned object is not null, it doesn't mean that subscription is active.
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

  /// Implements `Restore Purchases` mechanism. Basically it just sends current App Store Receipt (iOS) or  Play Market Purchase Tokens (Android) to Apphud and returns subscriptions info.
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
  static Future<void> syncPurchases({String? paywallIdentifier}) async {
    await _channel.invokeMethod(
      'syncPurchases',
      {
        'paywallIdentifier': paywallIdentifier,
      },
    );
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
    dynamic value,
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

  ///  Submit attribution data to Apphud from your attribution network provider.
  ///
  /// - parameter [data] is required. Attribution 'map'.
  /// - parameter [provider] is required. Attribution provider name. Available values: `ApphudAttributionProvider.appsFlyer`, `ApphudAttributionProvider.adjust`, `ApphudAttributionProvider.appleSearchAds`, `ApphudAttributionProvider.facebook`.
  /// - parameter [identifier] is optional. Identifier that matches Apphud and Attribution provider. Required for AppsFlyer.
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

  /// iOS only. Send search ads attribution data to Apphud.
  ///
  /// Returns [ApphudError] if an error occurred or null otherwise.
  static Future<ApphudError?> collectSearchAdsAttribution() async {
    final Map<dynamic, dynamic>? result =
        (await _channel.invokeMethod('collectSearchAdsAttribution'));
    return result != null ? ApphudError.fromJson(result) : null;
  }

// Other

  /// Enables debug logs. You should call this method before SDK initialization.
  ///
  /// - [iOS] only parameter [level] is optional. Default value is [ApphudDebugLevel.low].
  /// The value [ApphudDebugLevel.high] enables printing of additional debug messages, for example HTTP requests and responses
  static Future<void> enableDebugLogs({
    ApphudDebugLevel level = ApphudDebugLevel.low,
  }) =>
      _channel.invokeMethod('enableDebugLogs', {
        'level': level == ApphudDebugLevel.low ? 0 : 1,
      });

  ///  iOS only. Returns `true` if current build is running on simulator or Debug/TestFlight modes. Returns `false` if current build is App Store build.
  static Future<bool> isSandbox() async {
    final bool? value = await _channel.invokeMethod<bool>('isSandbox');
    assert(value != null, 'Error getting isSandbox, value = null');
    return value!;
  }

// Paywall logs

  /// Paywall shown event will be displayed in AppHud dashboard.
  static Future<void> paywallShown(ApphudPaywall paywall) async {
    await _channel.invokeMethod(
      'paywallShown',
      {'identifier': paywall.identifier},
    );
  }

  /// Paywall closed event will be displayed in AppHud dashboard.
  static Future<void> paywallClosed(ApphudPaywall paywall) async {
    await _channel.invokeMethod(
      'paywallClosed',
      {'identifier': paywall.identifier},
    );
  }

// Promotionals

  /// You can grant free promotional subscription to user. Returns `true` in a callback if promotional was granted.
  ///
  /// You should pass either `productId` (recommended) or `permissionGroup` OR both parameters `null`. Sending both `productId` and `permissionGroup` parameters will result in `productId` being used.
  /// - parameter [daysCount] is required. Number of days of free premium usage. For lifetime promotionals just pass extremely high value, like 10000.
  /// - parameter [productId] is optional. Recommended. Product Id of promotional subscription.
  /// - parameter [permissionGroup] is optional. Permission Group of promotional subscription. Use this parameter in case you have multiple permission groups.
  static Future<bool> grantPromotional({
    required int daysCount,
    String? productId,
    ApphudGroup? group,
  }) async {
    final bool? value = await _channel.invokeMethod<bool>(
      'grantPromotional',
      {
        'daysCount': daysCount,
        'productId': productId,
        'permissionGroupName': group?.name,
      },
    );
    return value!;
  }
}
