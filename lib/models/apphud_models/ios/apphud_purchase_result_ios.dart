import 'package:apphud/models/sk_product/sk_payment_transaction_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../mapper.dart';
import '../apphud_non_renewing_purchase.dart';
import '../apphud_subscription.dart';

part 'apphud_purchase_result_ios.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPurchaseResultIos {
  final ApphudSubscriptionWrapper? subscription;
  final ApphudNonRenewingPurchase? nonRenewingPurchase;
  final SKPaymentTransactionWrapper? transaction;

  ApphudPurchaseResultIos({
    this.subscription,
    this.nonRenewingPurchase,
    this.transaction,
  });

  factory ApphudPurchaseResultIos.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPurchaseResultIosFromJson(map);

  @override
  String toString() {
    return 'ApphudPurchaseResultIos{subscription: $subscription, nonRenewingPurchase: $nonRenewingPurchase, transaction: $transaction}';
  }
}
