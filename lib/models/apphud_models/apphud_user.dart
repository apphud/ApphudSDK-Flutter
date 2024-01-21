import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_user.g.dart';

@JsonSerializable(anyMap: true)
class ApphudUser {
  final String userId;
  final String? currencyCode;
  final List<ApphudSubscriptionWrapper> subscriptions;
  final List<ApphudNonRenewingPurchase> purchases;
  final List<ApphudPlacement> rawPlacements;
  final List<ApphudPaywall> rawPaywalls;
  final bool hasPurchases;

  ApphudUser({
    required this.userId,
    required this.currencyCode,
    required this.subscriptions,
    required this.purchases,
    required this.rawPlacements,
    required this.rawPaywalls,
    required this.hasPurchases,
  });

  @override
  String toString() {
    return 'ApphudUser{userId: $userId, currencyCode: $currencyCode, subscriptions: $subscriptions, purchases: $purchases, rawPlacements: $rawPlacements, rawPaywalls: $rawPaywalls, hasPurchases: $hasPurchases}';
  }

  factory ApphudUser.fromJson(Map<dynamic, dynamic> json) =>
      _$ApphudUserFromJson(json);

  Map<String, dynamic> toJson() => _$ApphudUserToJson(this);
}
