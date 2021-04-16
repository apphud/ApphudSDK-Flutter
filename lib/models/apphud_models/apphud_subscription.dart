import 'package:json_annotation/json_annotation.dart';

part 'apphud_subscription.g.dart';

@JsonSerializable(anyMap: true)
class ApphudSubscriptionWrapper {
  final String productId;
  final double expiresAt;
  final bool isInRetryBilling;
  final bool isAutorenewEnabled;
  final bool isIntroductoryActivated;
  final bool isActive;
  final ApphudSubscriptionStatus status;
  final double? canceledAt;
  final double? startedAt;

  ApphudSubscriptionWrapper({
    required this.productId,
    required this.expiresAt,
    required this.isInRetryBilling,
    required this.isAutorenewEnabled,
    required this.isIntroductoryActivated,
    required this.isActive,
    required this.status,
    this.startedAt,
    this.canceledAt,
  });

  factory ApphudSubscriptionWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudSubscriptionWrapperFromJson(map);

  @override
  String toString() {
    return 'ApphudSubscriptionWrapper{productId: $productId, expiresDate: $expiresDate, startedAt: $startedAt, isInRetryBilling: $isInRetryBilling, isAutorenewEnabled: $isAutorenewEnabled, isIntroductoryActivated: $isIntroductoryActivated, canceledAt: $canceledAt}';
  }
}

enum ApphudSubscriptionStatus {trial, intro, promo, grace, regular, refunded, expired }
