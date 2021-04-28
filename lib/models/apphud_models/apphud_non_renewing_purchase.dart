import 'package:json_annotation/json_annotation.dart';

part 'apphud_non_renewing_purchase.g.dart';

@JsonSerializable(anyMap: true)
class ApphudNonRenewingPurchase {
  final String productId;
  final double purchasedAt;
  final double? canceledAt;

  ApphudNonRenewingPurchase({
    required this.productId,
    required this.purchasedAt,
    this.canceledAt,
  });

  factory ApphudNonRenewingPurchase.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudNonRenewingPurchaseFromJson(map);

  @override
  String toString() {
    return 'ApphudNonRenewingPurchase{productId: $productId, purchasedAt: $purchasedAt, canceledAt: $canceledAt}';
  }
}
