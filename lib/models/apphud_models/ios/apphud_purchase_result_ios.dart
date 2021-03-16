import 'package:apphud/models/sk_product/sk_payment_transaction_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mapper.dart';
import '../apphud_non_renewing_purchase.dart';
import '../apphud_subscription.dart';

part 'apphud_purchase_result_ios.g.dart';

@JsonSerializable()
class ApphudPurchaseResultIos {

  @JsonKey(fromJson: Mapper.apphudSubscriptionWrapperFromJson)
  ApphudSubscriptionWrapper subscription;

  @JsonKey(fromJson: Mapper.apphudNonRenewingPurchaseFromJson)
  ApphudNonRenewingPurchase nonRenewingPurchase;

  @JsonKey(fromJson: Mapper.skPaymentTransactionWrapperFromJson)
  SKPaymentTransactionWrapper transaction;

  ApphudPurchaseResultIos({
    @required this.subscription,
    @required this.nonRenewingPurchase,
    @required this.transaction,
  });

  factory ApphudPurchaseResultIos.fromJson(Map map) {
    assert(map != null, 'Map must not be null.');
    return _$ApphudPurchaseResultIosFromJson(map);
  }
}