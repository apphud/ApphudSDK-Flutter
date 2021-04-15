import 'dart:io';

import 'package:appHud_example/routes/routes.dart';

class MakePurchaseRoutes extends BaseRoute {
  static const didFetchProductsNotification = "didFetchProductsNotification";
  static const productsDidFetchCallback = "productsDidFetchCallback";
  static const refreshStoreKitProducts = "refreshStoreKitProducts";
  static const products = "products";
  static const product = "product";
  static const purchase = "purchase";
  static const purchaseWithoutValidation = "purchaseWithoutValidation";
  static const purchasePromo = "purchasePromo";
  static const syncPurchases = "syncPurchases";

  MakePurchaseRoutes();

  List<String> get allRoute {
    return [
      didFetchProductsNotification,
      productsDidFetchCallback,
      refreshStoreKitProducts,
      products,
      product,
      purchase,
      purchaseWithoutValidation,
      purchasePromo,
    ];
  }

  bool isRouteEnabled(String route) {
    if (Platform.isIOS) {
      switch (route) {
        case MakePurchaseRoutes.syncPurchases:
          return false;
        default:
          return true;
      }
    } else if (Platform.isAndroid) {
      switch (route) {
        case MakePurchaseRoutes.productsDidFetchCallback:
        case MakePurchaseRoutes.product:
        case MakePurchaseRoutes.products:
        case MakePurchaseRoutes.purchase:
        case MakePurchaseRoutes.syncPurchases:
          return true;
        default:
          return false;
      }
    }
    return false;
  }
}
