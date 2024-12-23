import 'package:json_annotation/json_annotation.dart';

part 'apphud_non_renewing_purchase.g.dart';

@JsonSerializable(anyMap: true)
class ApphudNonRenewingPurchase {
  final String productId;
  final double purchasedAt;
  final double? canceledAt;
  final bool isActive;
  final String? purchaseToken;

  ApphudNonRenewingPurchase({
    required this.productId,
    required this.purchasedAt,
    required this.isActive,
    this.canceledAt,
    this.purchaseToken,
  });

  factory ApphudNonRenewingPurchase.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudNonRenewingPurchaseFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudNonRenewingPurchaseToJson(this);

  @override
  String toString() {
    return 'ApphudNonRenewingPurchase{productId: $productId, purchasedAt: $purchasedAt, canceledAt: $canceledAt, isActive: $isActive, purchaseToken: $purchaseToken}';
  }
}
