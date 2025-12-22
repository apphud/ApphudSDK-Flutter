import 'package:apphud/models/apphud_models/apphud_error.dart';
import 'package:json_annotation/json_annotation.dart';
import '../apphud_non_renewing_purchase.dart';
import '../apphud_subscription.dart';
import '../android/android_purchase_wrapper.dart';
import '../../sk_product/sk_payment_transaction_wrapper.dart';
part 'apphud_paywall_screen_show_result.g.dart';
@JsonSerializable(anyMap: true)
class ApphudPaywallScreenShowResult {
  /// Indicates whether the paywall operation was successful.
  /// - `true`: User completed a purchase successfully
  /// - `false`: User closed the paywall or an error occurred
  @JsonKey(defaultValue: false)
  final bool success;

  /// Indicates whether the user manually closed the paywall.
  /// - `true`: User manually dismissed the paywall
  /// - `false`: Paywall was closed due to successful purchase or error
  @JsonKey(defaultValue: false)
  final bool userClosed;

  /// Error information when the paywall operation failed.
  /// Only present when `success` is `false` and an error occurred.
  final ApphudError? error;

  /// Subscription object when user completed a successful subscription purchase.
  /// Only present when `success` is `true` and the purchase was a subscription.
  final ApphudSubscriptionWrapper? subscription;

  /// Non-renewing purchase object when user completed a successful one-time purchase.
  /// Only present when `success` is `true` and the purchase was non-renewing.
  final ApphudNonRenewingPurchase? nonRenewingPurchase;
  
  /// Android purchase object when user completed a successful transaction.
  /// Only present when `success` is `true` on Android platform.
  final AndroidPurchaseWrapper? purchase;

  /// iOS transaction object when user completed a successful transaction.
  /// Only present when `success` is `true` on iOS platform.
  final SKPaymentTransactionWrapper? transaction;

  ApphudPaywallScreenShowResult({
    required this.success,
    required this.userClosed,
    this.error,
    this.subscription,
    this.nonRenewingPurchase,
    this.purchase,
    this.transaction,
  });

  factory ApphudPaywallScreenShowResult.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPaywallScreenShowResultFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPaywallScreenShowResultToJson(this);

  @override
  String toString() {
    return 'ApphudPaywallScreenShowResult{success: $success, userClosed: $userClosed, error: $error, subscription: $subscription, nonRenewingPurchase: $nonRenewingPurchase, purchase: $purchase, transaction: $transaction}';
  }
}
