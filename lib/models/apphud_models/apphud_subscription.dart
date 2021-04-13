import 'package:json_annotation/json_annotation.dart';

part 'apphud_subscription.g.dart';

@JsonSerializable()
class ApphudSubscriptionWrapper {
  String? productId;
  double? expiresDate;
  double? startedAt;
  double? canceledAt;
  bool? isInRetryBilling;
  bool? isAutorenewEnabled;
  bool? isIntroductoryActivated;

  ApphudSubscriptionWrapper({
    required this.productId,
    required this.expiresDate,
    required this.startedAt,
    required this.canceledAt,
    required this.isInRetryBilling,
    required this.isAutorenewEnabled,
    required this.isIntroductoryActivated,
  });

  factory ApphudSubscriptionWrapper.fromJson(Map<String, dynamic> map) =>
      _$ApphudSubscriptionWrapperFromJson(map);
}
