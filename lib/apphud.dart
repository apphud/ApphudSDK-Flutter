import 'dart:async';

import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/mapper.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/services.dart';

import 'models/apphud_models/apphud_attribution_provider.dart';
import 'models/apphud_models/composite/apphud_product.dart';
import 'models/apphud_models/composite/apphud_purchase.dart';
import 'models/apphud_models/ios/apphud_purchase_result_ios.dart';
import 'extensions.dart';

class AppHud {
  static const MethodChannel _channel = const MethodChannel('appHud');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> start({
    required String apiKey,
    String? userID,
    bool? observerMode,
  }) =>
      _channel.invokeMethod('start', {
        "apiKey": apiKey,
        "userID": userID,
        "observerMode": observerMode ?? false,
      });

  static Future<void> startManually({
    required String apiKey,
    String? userID,
    String? deviceID,
    bool? observerMode,
  }) =>
      _channel.invokeMethod('startManually', {
        "apiKey": apiKey,
        "deviceID": deviceID,
        "userID": userID,
        "observerMode": observerMode ?? false,
      });

  static Future<void> updateUserID(String userID) =>
      _channel.invokeMethod("updateUserID", {"userID": userID});

  static Future<String> userID() async {
    return (await _channel.invokeMethod<String>('userID'))!;
  }

  static Future<String> deviceID() async {
    return (await _channel.invokeMethod('deviceID'))!;
  }

  static Future<void> logout() => _channel.invokeMethod("logout");

  static Future<String> didFetchProductsNotification() async {
    return (await _channel.invokeMethod('didFetchProductsNotification'))!;
  }

  static Future<List<ApphudProduct>> productsDidFetchCallback() async {
    List<Map<dynamic, dynamic>> products = (await _channel
            .invokeMethod<List<dynamic>>('productsDidFetchCallback'))!
        .toMapList;
    return products.map((json) => ApphudProduct.fromJson(json)).toList();
  }

  static Future<List<SKProductWrapper>> refreshStoreKitProducts() async {
    List<Map<dynamic, dynamic>> products =
        (await _channel.invokeMethod<List<dynamic>>('refreshStoreKitProducts'))!
            .toMapList;

    return products.map((json) => SKProductWrapper.fromJson(json)).toList();
  }

  static Future<ApphudProduct?> product(String productIdentifier) async {
    final Map<dynamic, dynamic>? json =
        await _channel.invokeMethod<Map<dynamic, dynamic>>(
      'product',
      {"productIdentifier": productIdentifier},
    );

    return json != null ? ApphudProduct.fromJson(json) : null;
  }

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

//
// static Future<void> disableIDFACollection() async {
//   await _channel.invokeMethod(
//     'disableIDFACollection',
//   );
// }
//
// static Future<void> setAdvertisingIdentifier(String idfa) async {
//   await _channel.invokeMethod(
//     'setAdvertisingIdentifier',
//     {"idfa": idfa},
//   );
// }
//
// static Future<bool?> addAttribution(
//     {required Map<String, dynamic> data,
//     required ApphudAttributionProvider provider,
//     String? identifer}) async {
//   bool? isAdded = await _channel.invokeMethod("addAttribution", {
//     "data": data,
//     "from":
//         ApphudAttributionProviderToStringConventer.convertToString(provider),
//     "identifer": identifer
//   });
//   return isAdded;
// }

  static Future<void> enableDebugLogs() =>
      _channel.invokeMethod("enableDebugLogs");
}
