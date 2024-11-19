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
  final double startedAt;
  final String? purchaseToken;

  ApphudSubscriptionWrapper({
    required this.productId,
    required this.expiresAt,
    required this.isInRetryBilling,
    required this.isAutorenewEnabled,
    required this.isIntroductoryActivated,
    required this.isActive,
    required this.status,
    required this.startedAt,
    this.canceledAt,
    this.purchaseToken,
  });

  factory ApphudSubscriptionWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudSubscriptionWrapperFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudSubscriptionWrapperToJson(this);

  @override
  String toString() {
    return 'ApphudSubscriptionWrapper{productId: $productId, expiresAt: $expiresAt, isInRetryBilling: $isInRetryBilling, isAutorenewEnabled: $isAutorenewEnabled, isIntroductoryActivated: $isIntroductoryActivated, isActive: $isActive, status: $status, canceledAt: $canceledAt, startedAt: $startedAt, purchaseToken: $purchaseToken}';
  }
}

enum ApphudSubscriptionStatus {
  trial,
  intro,
  promo,
  grace,
  regular,
  refunded,
  expired,
}
