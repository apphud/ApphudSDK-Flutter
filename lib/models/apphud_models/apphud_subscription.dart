import 'package:json_annotation/json_annotation.dart';

part 'apphud_subscription.g.dart';

@JsonSerializable(anyMap: true)
class ApphudSubscriptionWrapper {
  final String productId;
  final double expiresDate;
  final double startedAt;
  final bool isInRetryBilling;
  final bool isAutorenewEnabled;
  final bool isIntroductoryActivated;
  final double? canceledAt;

  ApphudSubscriptionWrapper({
    required this.productId,
    required this.expiresDate,
    required this.startedAt,
    required this.isInRetryBilling,
    required this.isAutorenewEnabled,
    required this.isIntroductoryActivated,
    this.canceledAt,
  });

  factory ApphudSubscriptionWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudSubscriptionWrapperFromJson(map);

  @override
  String toString() {
    return 'ApphudSubscriptionWrapper{productId: $productId, expiresDate: $expiresDate, startedAt: $startedAt, isInRetryBilling: $isInRetryBilling, isAutorenewEnabled: $isAutorenewEnabled, isIntroductoryActivated: $isIntroductoryActivated, canceledAt: $canceledAt}';
  }
}
