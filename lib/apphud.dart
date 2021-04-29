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

  static Future<ApphudPurchase> purchase(String productId) async {
    final dynamic? json = await _channel.invokeMethod(
      'purchase',
      {"productId": productId},
    );
    return ApphudPurchase.fromJson(json);
  }

  static Future<ApphudPurchaseResultIos> purchaseWithoutValidation(
      String productId) async {
    final dynamic? json = await _channel.invokeMethod(
      'purchaseWithoutValidation',
      {"productId": productId},
    );
    return ApphudPurchaseResultIos.fromJson(json!);
  }

//@available(iOS 12.2, *)
  static Future<ApphudPurchaseResultIos> purchasePromo({
    required String productId,
    required String discountID,
  }) async {
    final dynamic? json = await _channel.invokeMethod(
      'purchasePromo',
      {
        "productId": productId,
        "discountID": discountID,
      },
    );
    return ApphudPurchaseResultIos.fromJson(json!);
  }

  static Future<bool> hasActiveSubscription() async {
    return (await _channel.invokeMethod('hasActiveSubscription')) ?? false;
  }

  static Future<ApphudSubscriptionWrapper?> subscription() async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>('subscription');
    return json != null ? ApphudSubscriptionWrapper.fromJson(json) : null;
  }

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

  static Future<bool> isNonRenewingPurchaseActive(
    String productIdentifier,
  ) async {
    return (await _channel.invokeMethod<bool>(
          'isNonRenewingPurchaseActive',
          {"productIdentifier": productIdentifier},
        )) ??
        false;
  }

  static Future<ApphudComposite> restorePurchases() async {
    final Map<dynamic, dynamic> json = (await _channel
        .invokeMethod<Map<dynamic, dynamic>>('restorePurchases'))!;

    return ApphudComposite.fromJson(json);
  }

// Android only
  static Future<void> syncPurchases() async {
    await _channel.invokeMethod('syncPurchases');
  }

  static Future<ApphudComposite> migratePurchasesIfNeeded() async {
    final Map<dynamic, dynamic> json = (await _channel
        .invokeMethod<Map<dynamic, dynamic>>('migratePurchasesIfNeeded'))!;

    return ApphudComposite.fromJson(json);
  }

  static Future<Map<String, dynamic>?> fetchRawReceiptInfo() async {
    final Map<dynamic, dynamic>? json = await _channel.invokeMethod(
      'fetchRawReceiptInfo',
    );
    return json != null ? Map<String, dynamic>.from(json) : null;
  }

  static Future<void> disableIDFACollection() async {
    await _channel.invokeMethod('disableIDFACollection');
  }

  static Future<void> setAdvertisingIdentifier(String idfa) async {
    await _channel.invokeMethod(
      'setAdvertisingIdentifier',
      {"idfa": idfa},
    );
  }

  static Future<bool> addAttribution({
    required Map<String, dynamic> data,
    required ApphudAttributionProvider provider,
    String? identifer,
  }) async {
    final bool isAdded = await _channel.invokeMethod("addAttribution", {
      "data": data,
      "from": provider.convertToString,
      "identifer": identifer
    });
    return isAdded;
  }

  static Future<void> enableDebugLogs() =>
      _channel.invokeMethod("enableDebugLogs");

  static Future<void> presentOfferCodeRedemptionSheet() async {
    await _channel.invokeMethod('presentOfferCodeRedemptionSheet');
  }

  static Future<ApphudComposite> validateReceipt() async {
    final Map<dynamic, dynamic> json = (await _channel
        .invokeMethod<Map<dynamic, dynamic>>('validateReceipt'))!;

    return ApphudComposite.fromJson(json);
  }

  static Future<String?> appStoreReceipt() async {
    return (await _channel.invokeMethod('appStoreReceipt'))!;
  }

  static Future<bool> isSandbox() async {
    final bool? value = await _channel.invokeMethod<bool>('isSandbox');
    assert(value != null, 'Error getting isSandbox, value = null');
    return value!;
  }

  static Future<void> setUserProperty({
    required ApphudUserPropertyKey key,
    dynamic? value,
    bool setOnce = false,
  }) async {
    await _channel.invokeMethod(
      'setUserProperty',
      {
        "key": key.keyName,
        "value": value,
        "setOnce": setOnce,
      },
    );
  }

  static Future<void> incrementUserProperty({
    required ApphudUserPropertyKey key,
    required dynamic by,
  }) async {
    await _channel.invokeMethod(
      'incrementUserProperty',
      {
        "key": key.keyName,
        "by": by,
      },
    );
  }

  static Future<void> disableAdTracking() =>
      _channel.invokeMethod("disableAdTracking");
}
