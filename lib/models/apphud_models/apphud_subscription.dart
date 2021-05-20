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
  final bool? isSandbox;
  final bool? isLocal;

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
    this.isSandbox,
    this.isLocal,
  });

  factory ApphudSubscriptionWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudSubscriptionWrapperFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudSubscriptionWrapperToJson(this);

  @override
  String toString() {
    return 'ApphudSubscriptionWrapper{productId: $productId, expiresAt: $expiresAt, isInRetryBilling: $isInRetryBilling, isAutorenewEnabled: $isAutorenewEnabled, isIntroductoryActivated: $isIntroductoryActivated, isActive: $isActive, status: $status, canceledAt: $canceledAt, startedAt: $startedAt, isSandbox: $isSandbox, isLocal: $isLocal}';
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
