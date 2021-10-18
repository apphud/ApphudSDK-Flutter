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
      status: _$enumDecode(_$ApphudSubscriptionStatusEnumMap, json['status']),
      startedAt: (json['startedAt'] as num?)?.toDouble(),
      canceledAt: (json['canceledAt'] as num?)?.toDouble(),
      isSandbox: json['isSandbox'] as bool?,
      isLocal: json['isLocal'] as bool?,
    );

Map<String, dynamic> _$ApphudSubscriptionWrapperToJson(
        ApphudSubscriptionWrapper instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'expiresAt': instance.expiresAt,
      'isInRetryBilling': instance.isInRetryBilling,
      'isAutorenewEnabled': instance.isAutorenewEnabled,
      'isIntroductoryActivated': instance.isIntroductoryActivated,
      'isActive': instance.isActive,
      'status': _$ApphudSubscriptionStatusEnumMap[instance.status],
      'canceledAt': instance.canceledAt,
      'startedAt': instance.startedAt,
      'isSandbox': instance.isSandbox,
      'isLocal': instance.isLocal,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
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
