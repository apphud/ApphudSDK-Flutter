// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_period_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKProductSubscriptionPeriodWrapper _$SKProductSubscriptionPeriodWrapperFromJson(
        Map json) =>
    SKProductSubscriptionPeriodWrapper(
      numberOfUnits: json['numberOfUnits'] as int,
      unit: $enumDecode(_$SKSubscriptionPeriodTimeEnumMap, json['unit']),
    );

Map<String, dynamic> _$SKProductSubscriptionPeriodWrapperToJson(
        SKProductSubscriptionPeriodWrapper instance) =>
    <String, dynamic>{
      'numberOfUnits': instance.numberOfUnits,
      'unit': _$SKSubscriptionPeriodTimeEnumMap[instance.unit],
    };

const _$SKSubscriptionPeriodTimeEnumMap = {
  SKSubscriptionPeriodTime.day: 0,
  SKSubscriptionPeriodTime.week: 1,
  SKSubscriptionPeriodTime.month: 2,
  SKSubscriptionPeriodTime.year: 3,
};
