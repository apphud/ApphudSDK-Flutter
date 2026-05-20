import 'dart:convert';

import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud/models/apphud_models/apphud_subscription.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_user.g.dart';

@JsonSerializable(anyMap: true)
class ApphudUser {
  final String userId;
  final List<ApphudSubscriptionWrapper> subscriptions;
  final List<ApphudNonRenewingPurchase> purchases;
  final List<ApphudPlacement> rawPlacements;

  /// Whether the user has any subscriptions or non-renewing purchases.
  ///
  /// Mirrors native `hasPurchases()` on Android.
  final bool hasPurchases;

  /// Number of devices associated with the same [userId].
  final int totalDevicesCount;

  /// Internal database id of the user. Should not be used in analytics.
  final String internalId;

  /// Name of the active A/B test experiment assigned to this user.
  final String? experimentName;

  /// Name of the active variation assigned to this user.
  final String? variationName;

  /// Name of the targeting (audience) the user matches into.
  final String? targetingName;

  /// Raw JSON string for the app-level remote configuration assigned to this user.
  final String? remoteConfigString;

  ApphudUser({
    required this.userId,
    required this.subscriptions,
    required this.purchases,
    required this.rawPlacements,
    required this.hasPurchases,
    this.totalDevicesCount = 0,
    this.internalId = '',
    this.experimentName,
    this.variationName,
    this.targetingName,
    this.remoteConfigString,
  });

  /// Global app-level remote configuration payload for the active user variation.
  ///
  /// Parsed from [remoteConfigString]. Returns an empty map when config is missing or invalid.
  Map<String, dynamic> remoteConfig() {
    final raw = remoteConfigString;
    if (raw == null || raw.isEmpty) {
      return {};
    }
    try {
      final decoded = jsonDecode(raw);
      if (decoded is Map) {
        return Map<String, dynamic>.from(decoded);
      }
    } catch (_) {
      // ignore invalid JSON
    }
    return {};
  }

  @override
  String toString() {
    return 'ApphudUser{userId: $userId, subscriptions: $subscriptions, purchases: $purchases, rawPlacements: $rawPlacements, hasPurchases: $hasPurchases, totalDevicesCount: $totalDevicesCount, internalId: $internalId, experimentName: $experimentName, variationName: $variationName, targetingName: $targetingName, remoteConfigString: $remoteConfigString}';
  }

  factory ApphudUser.fromJson(Map<dynamic, dynamic> json) =>
      _$ApphudUserFromJson(json);

  Map<String, dynamic> toJson() => _$ApphudUserToJson(this);
}
