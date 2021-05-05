import 'dart:io';

import 'package:appHud_example/routes/routes.dart';

class HandlePurchaseRoutes extends BaseRoute {
  static const hasActiveSubscription = "hasActiveSubscription";
  static const subscription = "subscription";
  static const subscriptions = "subscriptions";
  static const nonRenewingPurchases = "nonRenewingPurchases";
  static const isNonRenewingPurchaseActive = "isNonRenewingPurchaseActive";
  static const restorePurchases = "restorePurchases";
  static const migratePurchasesIfNeeded = "migratePurchasesIfNeeded";
  static const fetchRawReceiptInfo = "fetchRawReceiptInfo";
  static const validateReceipt = "validateReceipt";
  static const appStoreReceipt = "appStoreReceipt";

  HandlePurchaseRoutes();

  List<String> get allRoute {
    return [
      hasActiveSubscription,
      subscription,
      subscriptions,
      nonRenewingPurchases,
      isNonRenewingPurchaseActive,
      restorePurchases,
      migratePurchasesIfNeeded,
      fetchRawReceiptInfo,
      validateReceipt,
      appStoreReceipt,
    ];
  }

  bool isRouteEnabled(String route) {
    if (Platform.isIOS) {
      switch (route) {
        default:
          return true;
      }
    } else if (Platform.isAndroid) {
      switch (route) {
        case HandlePurchaseRoutes.hasActiveSubscription:
        case HandlePurchaseRoutes.subscription:
        case HandlePurchaseRoutes.subscriptions:
        case HandlePurchaseRoutes.nonRenewingPurchases:
        case HandlePurchaseRoutes.isNonRenewingPurchaseActive:
        case HandlePurchaseRoutes.restorePurchases:
          return true;
        default:
          return false;
      }
    }
    return false;
  }
}
