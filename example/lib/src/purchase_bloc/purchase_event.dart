import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_event.freezed.dart';

@freezed
class PurchaseEvent with _$PurchaseEvent {
  const PurchaseEvent._();

  const factory PurchaseEvent.started() = PurchaseStartedEvent;

  const factory PurchaseEvent.paywallsFetched(ApphudPaywalls paywalls) =
      PurchasePaywallsFetchedEvent;

  const factory PurchaseEvent.placementsFetched(
    List<ApphudPlacement> placements,
  ) = PurchasePlacementsFetchedEvent;

  const factory PurchaseEvent.restorePurchases() =
      PurchaseRestorePurchasesEvent;

  const factory PurchaseEvent.purchaseProduct(ApphudProduct product) =
      PurchasePurchaseProductEvent;

  const factory PurchaseEvent.grantPromotional(ApphudProduct product) =
      PurchaseGrantPromotionalEvent;

  const factory PurchaseEvent.trackPurchase(ApphudProduct product) =
      PurchaseTrackPurchaseEvent;

  const factory PurchaseEvent.paywallShown(ApphudPaywall paywall) =
      PurchasePaywallShownEvent;

  const factory PurchaseEvent.paywallClosed(ApphudPaywall paywall) =
      PurchasePaywallClosedEvent;

  const factory PurchaseEvent.syncPurchase() = PurchaseSyncPurchaseEvent;

  const factory PurchaseEvent.callAll() = PurchaseCallAllEvent;
}
