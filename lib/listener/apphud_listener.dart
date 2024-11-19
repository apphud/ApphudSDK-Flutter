import 'package:apphud/models/apphud_models/android/android_purchase_wrapper.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:apphud/models/apphud_models/apphud_user.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';

abstract class ApphudListener {
  /// Called when user identifier was changed
  Future<void> apphudDidChangeUserID(String userId);

  /// Returns array of products after they are fetched from Google Billing or StoreKit.
  /// Note that you have to add all product identifiers in Apphud.
  Future<void> apphudDidFecthProducts(List<ApphudProductComposite> products);

  /// Called when paywalls are fully loaded with their SkuDetails or SkProducts
  Future<void> paywallsDidFullyLoad(ApphudPaywalls paywalls);

  /// This method is invoked when a user is registered in Apphud or retrieved from the cache. It is called once per app lifecycle.
  ///
  /// The ApphudUser object passed as a parameter contains a record of all
  /// purchases tracked by Apphud and associated raw placements and paywalls for that user.
  /// These lists may or may not have their inner Google Play products fully loaded at the time of this method's call.
  Future<void> userDidLoad(ApphudUser user);

  /// Returns array of subscriptions that user ever purchased. Empty array means user never purchased a subscription.
  ///
  /// If you have just one subscription group in your app, you will always receive just one subscription in an array.
  /// This method is called when subscription is purchased or updated
  /// (for example, status changed from `trial` to `expired` or `isAutorenewEnabled` changed to `false`).
  /// SDK also checks for subscription updates when app becomes active.
  Future<void> apphudSubscriptionsUpdated(
    List<ApphudSubscriptionWrapper> subscriptions,
  );

  /// Called when any of non renewing purchases changes. Called when purchase is made or has been refunded.
  Future<void> apphudNonRenewingPurchasesUpdated(
    List<ApphudNonRenewingPurchase> purchases,
  );

  /// Called when placements are fully loaded with their ApphudPaywalls and inner ProductDetails.
  Future<void> placementsDidFullyLoad(List<ApphudPlacement> placements);

  /// Android only. Called when Apphud receives purchase from Google.
  Future<void> apphudDidReceivePurchase(AndroidPurchaseWrapper purchase);
}
