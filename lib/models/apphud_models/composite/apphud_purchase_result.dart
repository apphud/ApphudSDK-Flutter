import 'package:apphud/models/apphud_models/android/android_purchase_wrapper.dart';
import 'package:apphud/models/apphud_models/apphud_error.dart';
import 'package:apphud/models/sk_product/sk_payment_transaction_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

import '../apphud_non_renewing_purchase.dart';
import '../apphud_subscription.dart';

part 'apphud_purchase_result.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPurchaseResult {
  final ApphudSubscriptionWrapper? subscription;
  final ApphudNonRenewingPurchase? nonRenewingPurchase;
  final SKPaymentTransactionWrapper? transaction;
  final AndroidPurchaseWrapper? purchase;
  final ApphudError? error;

  ApphudPurchaseResult({
    this.subscription,
    this.nonRenewingPurchase,
    this.transaction,
    this.purchase,
    this.error,
  });

  factory ApphudPurchaseResult.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPurchaseResultFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPurchaseResultToJson(this);

  @override
  String toString() {
    return 'ApphudPurchaseResult{subscription: $subscription, nonRenewingPurchase: $nonRenewingPurchase, transaction: $transaction, purchase: $purchase, error: $error}';
  }
}
