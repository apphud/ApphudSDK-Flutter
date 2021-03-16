import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_non_renewing_purchase.g.dart';

@JsonSerializable(nullable: true)
class ApphudNonRenewingPurchase {
  String productId;
  double purchasedAt;
  double canceledAt;

  ApphudNonRenewingPurchase({
    @required this.productId,
    @required this.purchasedAt,
    @required this.canceledAt,
  });

  factory ApphudNonRenewingPurchase.fromJson(Map map) {
    assert(map != null, 'Map must not be null.');
    return _$ApphudNonRenewingPurchaseFromJson(map);
  }
}