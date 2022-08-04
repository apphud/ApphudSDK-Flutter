import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_event.freezed.dart';

@freezed
class PurchaseEvent with _$PurchaseEvent {
  const PurchaseEvent._();

  const factory PurchaseEvent.restorePurchases() = RestorePurchases;

  const factory PurchaseEvent.purchaseProduct(ApphudProduct product) =
      PurchaseProduct;

  const factory PurchaseEvent.grantPromotional(ApphudProduct product) =
      GrantPromotional;

  const factory PurchaseEvent.paywallShown(ApphudPaywall paywall) =
      PaywallShown;

  const factory PurchaseEvent.paywallClosed(ApphudPaywall paywall) =
      PaywallClosed;

  const factory PurchaseEvent.refreshEntitlements() = RefreshEntitlements;
}
