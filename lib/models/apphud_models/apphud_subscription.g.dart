// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudSubscriptionWrapper _$ApphudSubscriptionWrapperFromJson(
    Map<String, dynamic> json) {
  return ApphudSubscriptionWrapper(
    productId: json['productId'] as String?,
    expiresDate: (json['expiresDate'] as num?)?.toDouble(),
    startedAt: (json['startedAt'] as num?)?.toDouble(),
    canceledAt: (json['canceledAt'] as num?)?.toDouble(),
    isInRetryBilling: json['isInRetryBilling'] as bool?,
    isAutorenewEnabled: json['isAutorenewEnabled'] as bool?,
    isIntroductoryActivated: json['isIntroductoryActivated'] as bool?,
  );
}

Map<String, dynamic> _$ApphudSubscriptionWrapperToJson(
        ApphudSubscriptionWrapper instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'expiresDate': instance.expiresDate,
      'startedAt': instance.startedAt,
      'canceledAt': instance.canceledAt,
      'isInRetryBilling': instance.isInRetryBilling,
      'isAutorenewEnabled': instance.isAutorenewEnabled,
      'isIntroductoryActivated': instance.isIntroductoryActivated,
    };
