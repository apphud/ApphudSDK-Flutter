import 'package:apphud/models/apphud_models/apphud_paywall_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_event.freezed.dart';

@freezed
class PurchaseEvent with _$PurchaseEvent {
  const PurchaseEvent._();

  const factory PurchaseEvent.purchase(String id) = Purchase;

  const factory PurchaseEvent.restorePurchases() = RestorePurchases;

  const factory PurchaseEvent.purchaseProduct(ApphudPaywallProduct product) =
      PurchaseProduct;
}
