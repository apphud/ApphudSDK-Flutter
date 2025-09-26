import 'package:apphud/models/apphud_models/apphud_error.dart';
import 'package:apphud/models/apphud_models/composite/apphud_purchase_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_paywall_screen_show_result.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPaywallScreenShowResult {
  /// Indicates whether the paywall operation was successful.
  /// - `true`: User completed a purchase successfully
  /// - `false`: User closed the paywall or an error occurred
  final bool success;
  
  /// Error information if the paywall failed to display or fetch.
  /// Only present when `success` is `false` and an error occurred.
  final ApphudError? error;
  
  /// Indicates whether the user manually closed the paywall.
  /// - `true`: User manually dismissed the paywall
  /// - `false`: Paywall was closed due to successful purchase or error
  final bool userClosed;
  
  /// Purchase result when user completed a successful transaction.
  /// Only present when `success` is `true`.
  final ApphudPurchaseResult? purchaseResult;

  ApphudPaywallScreenShowResult({
    required this.success,
    required this.userClosed,
    this.error,
    this.purchaseResult,
  });

  factory ApphudPaywallScreenShowResult.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPaywallScreenShowResultFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPaywallScreenShowResultToJson(this);

  @override
  String toString() {
    return 'ApphudPaywallScreenShowResult{success: $success, error: $error, userClosed: $userClosed, purchaseResult: $purchaseResult}';
  }
}
