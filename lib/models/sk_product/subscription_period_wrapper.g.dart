// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_period_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKProductSubscriptionPeriodWrapper _$SKProductSubscriptionPeriodWrapperFromJson(
    Map<String, dynamic> json) {
  return SKProductSubscriptionPeriodWrapper(
    numberOfUnits: json['numberOfUnits'] as int,
    time: _$enumDecodeNullable(_$SKSubscriptionPeriodTimeEnumMap, json['time']),
  );
}

Map<String, dynamic> _$SKProductSubscriptionPeriodWrapperToJson(
        SKProductSubscriptionPeriodWrapper instance) =>
    <String, dynamic>{
      'numberOfUnits': instance.numberOfUnits,
      'time': _$SKSubscriptionPeriodTimeEnumMap[instance.time],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SKSubscriptionPeriodTimeEnumMap = {
  SKSubscriptionPeriodTime.day: 0,
  SKSubscriptionPeriodTime.week: 1,
  SKSubscriptionPeriodTime.month: 2,
  SKSubscriptionPeriodTime.year: 3,
};
