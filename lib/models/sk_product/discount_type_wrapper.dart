import 'package:json_annotation/json_annotation.dart';

/// Mirrors `SKProductDiscount.Type` from StoreKit.
///
/// `introductory` — one-time introductory offer attached to a subscription.
/// `subscription` — promotional offer with a non-null `identifier` that can be
/// passed to `Apphud.purchasePromo(productId:, discountID:)`.
enum SKProductDiscountType {
  @JsonValue(0)
  introductory,
  @JsonValue(1)
  subscription,
}
