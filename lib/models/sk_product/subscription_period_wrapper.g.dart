// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_period_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKProductSubscriptionPeriodWrapper _$SKProductSubscriptionPeriodWrapperFromJson(
        Map json) =>
    SKProductSubscriptionPeriodWrapper(
      numberOfUnits: json['numberOfUnits'] as int,
      unit: _$enumDecode(_$SKSubscriptionPeriodTimeEnumMap, json['unit']),
    );

Map<String, dynamic> _$SKProductSubscriptionPeriodWrapperToJson(
        SKProductSubscriptionPeriodWrapper instance) =>
    <String, dynamic>{
      'numberOfUnits': instance.numberOfUnits,
      'unit': _$SKSubscriptionPeriodTimeEnumMap[instance.unit],
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

const _$SKSubscriptionPeriodTimeEnumMap = {
  SKSubscriptionPeriodTime.day: 0,
  SKSubscriptionPeriodTime.week: 1,
  SKSubscriptionPeriodTime.month: 2,
  SKSubscriptionPeriodTime.year: 3,
};
