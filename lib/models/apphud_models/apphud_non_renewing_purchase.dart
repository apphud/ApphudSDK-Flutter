import 'package:json_annotation/json_annotation.dart';

part 'apphud_non_renewing_purchase.g.dart';

@JsonSerializable(anyMap: true)
class ApphudNonRenewingPurchase {
  final String productId;
  final double purchasedAt;
  final double? canceledAt;
  final bool isActive;
  final String? purchaseToken;
  @JsonKey(includeIfNull: false)
  final String? platform;

  /// Returns `true` if purchase is made in test environment. Only available on iOS.
  final bool? isSandbox;

  /// Returns `true` if purchase was made using Local StoreKit Configuration File. Only available on iOS.
  final bool? isLocal;

  /// Returns `true` if purchase is consumable.
  /// On Android: Available directly from this property.
  /// On iOS: Use `Apphud.isNonRenewingPurchaseConsumable(productId)` async method instead.
  final bool? isConsumable;

  ApphudNonRenewingPurchase({
    required this.productId,
    required this.purchasedAt,
    required this.isActive,
    this.canceledAt,
    this.purchaseToken,
    this.platform,
    this.isSandbox,
    this.isLocal,
    this.isConsumable,
  });

  factory ApphudNonRenewingPurchase.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudNonRenewingPurchaseFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudNonRenewingPurchaseToJson(this);

  @override
  String toString() {
    return 'ApphudNonRenewingPurchase{productId: $productId, platform: $platform, purchasedAt: $purchasedAt, canceledAt: $canceledAt, isActive: $isActive, purchaseToken: $purchaseToken, isSandbox: $isSandbox, isLocal: $isLocal, isConsumable: $isConsumable}';
  }
}
