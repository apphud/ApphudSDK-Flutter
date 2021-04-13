import 'package:json_annotation/json_annotation.dart';

part 'apphud_non_renewing_purchase.g.dart';

@JsonSerializable()
class ApphudNonRenewingPurchase {
  String? productId;
  double? purchasedAt;
  double? canceledAt;

  ApphudNonRenewingPurchase({
    required this.productId,
    required this.purchasedAt,
    required this.canceledAt,
  });

  factory ApphudNonRenewingPurchase.fromJson(Map<String, dynamic> map) =>
      _$ApphudNonRenewingPurchaseFromJson(map);
}
