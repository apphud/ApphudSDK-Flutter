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

  static Future<ApphudPurchaseResultIos?> purchaseWithoutValidation(
      String productId) async {
    final dynamic? json = await _channel.invokeMethod(
      'purchaseWithoutValidation',
      {"productId": productId},
    );
    return ApphudPurchaseResultIos.fromJson(json!);
  }

//
// //@available(iOS 12.2, *)
// static Future<ApphudPurchaseResultIos?> purchasePromo(
//     String productId, String discountID) async {
//   var json = await _channel.invokeMethod(
//     'purchasePromo',
//     {
//       "productId": productId,
//       "discountID": discountID,
//     },
//   );
//   ApphudPurchaseResultIos? result =
//       Mapper.ApphudPurchaseResultIosFromJson(json);
//   return result;
// }
//
// static Future<bool?> hasActiveSubscription() async {
//   return _channel.invokeMethod('hasActiveSubscription');
// }
//
// static Future<ApphudSubscriptionWrapper?> subscription() async {
//   var subscriptionJson = await _channel.invokeMethod('subscription');
//   ApphudSubscriptionWrapper? subscription =
//       Mapper.apphudSubscriptionWrapperFromJson(subscriptionJson);
//   return subscription;
// }
//
// static Future<List<ApphudSubscriptionWrapper?>> subscriptions() async {
//   List<dynamic>? subscriptionsJson =
//       await _channel.invokeMethod('subscriptions');
//
//   if (subscriptionsJson != null) {
//     List<ApphudSubscriptionWrapper?> subscriptions = subscriptionsJson
//         .map((json) => Mapper.apphudSubscriptionWrapperFromJson(json))
//         .toList();
//
//     return subscriptions;
//   }
//
//   return List<ApphudSubscriptionWrapper?>.of([]);
// }
//
// static Future<List<ApphudNonRenewingPurchase?>> nonRenewingPurchases() async {
//   List<dynamic>? purchasesJson =
//       await _channel.invokeMethod('nonRenewingPurchases');
//   if (purchasesJson != null) {
//     List<ApphudNonRenewingPurchase?> purchases = purchasesJson
//         .map((json) => Mapper.apphudNonRenewingPurchaseFromJson(json))
//         .toList();
//     return purchases;
//   }
//   return List<ApphudNonRenewingPurchase?>.of([]);
// }
//
// static Future<bool?> isNonRenewingPurchaseActive(String productIdentifier) {
//   return _channel.invokeMethod(
//     'isNonRenewingPurchaseActive',
//     {"productIdentifier": productIdentifier},
//   );
// }
//
// static Future<ApphudComposite?> restorePurchases() async {
//   var json = await _channel.invokeMethod(
//     'restorePurchases',
//   );
//   return Mapper.apphudCompositeFromJson(json);
// }
//
// // Android only
// static Future<void> syncPurchases() async {
//   await _channel.invokeMethod(
//     'syncPurchases',
//   );
// }
//
// static Future<ApphudComposite?> migratePurchasesIfNeeded() async {
//   List<dynamic>? json = await _channel.invokeMethod(
//     'migratePurchasesIfNeeded',
//   );
//   return Mapper.apphudCompositeFromJson(json);
// }
//
// static Future<dynamic> fetchRawReceiptInfo() async {
//   var json = await _channel.invokeMethod(
//     'fetchRawReceiptInfo',
//   );
//
//   return json;
// }
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
