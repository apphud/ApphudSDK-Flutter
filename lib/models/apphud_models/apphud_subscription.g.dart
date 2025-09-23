// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudSubscriptionWrapper _$ApphudSubscriptionWrapperFromJson(Map json) =>
    ApphudSubscriptionWrapper(
      productId: json['productId'] as String,
      expiresAt: (json['expiresAt'] as num).toDouble(),
      isInRetryBilling: json['isInRetryBilling'] as bool,
      isAutorenewEnabled: json['isAutorenewEnabled'] as bool,
      isIntroductoryActivated: json['isIntroductoryActivated'] as bool,
      isActive: json['isActive'] as bool,
      status: $enumDecode(_$ApphudSubscriptionStatusEnumMap, json['status']),
      startedAt: (json['startedAt'] as num).toDouble(),
      canceledAt: (json['canceledAt'] as num?)?.toDouble(),
      purchaseToken: json['purchaseToken'] as String?,
      platform: json['platform'] as String?,
      basePlanId: json['basePlanId'] as String?,
    );

Map<String, dynamic> _$ApphudSubscriptionWrapperToJson(
    ApphudSubscriptionWrapper instance) {
  final val = <String, dynamic>{
    'productId': instance.productId,
    'expiresAt': instance.expiresAt,
    'isInRetryBilling': instance.isInRetryBilling,
    'isAutorenewEnabled': instance.isAutorenewEnabled,
    'isIntroductoryActivated': instance.isIntroductoryActivated,
    'isActive': instance.isActive,
    'status': _$ApphudSubscriptionStatusEnumMap[instance.status]!,
    'canceledAt': instance.canceledAt,
    'startedAt': instance.startedAt,
    'purchaseToken': instance.purchaseToken,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('platform', instance.platform);
  writeNotNull('basePlanId', instance.basePlanId);
  return val;
}

const _$ApphudSubscriptionStatusEnumMap = {
  ApphudSubscriptionStatus.trial: 'trial',
  ApphudSubscriptionStatus.intro: 'intro',
  ApphudSubscriptionStatus.promo: 'promo',
  ApphudSubscriptionStatus.grace: 'grace',
  ApphudSubscriptionStatus.regular: 'regular',
  ApphudSubscriptionStatus.refunded: 'refunded',
  ApphudSubscriptionStatus.expired: 'expired',
};
