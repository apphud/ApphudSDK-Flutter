// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKProductDiscountWrapper _$SKProductDiscountWrapperFromJson(Map json) =>
    SKProductDiscountWrapper(
      price: json['price'] as String,
      numberOfPeriods: json['numberOfPeriods'] as int,
      paymentMode: _$enumDecode(
          _$SKProductDiscountPaymentModeEnumMap, json['paymentMode']),
      priceLocale: SKPriceLocaleWrapper.fromJson(json['priceLocale'] as Map),
      subscriptionPeriod: SKProductSubscriptionPeriodWrapper.fromJson(
          json['subscriptionPeriod'] as Map),
    );

Map<String, dynamic> _$SKProductDiscountWrapperToJson(
        SKProductDiscountWrapper instance) =>
    <String, dynamic>{
      'price': instance.price,
      'numberOfPeriods': instance.numberOfPeriods,
      'paymentMode':
          _$SKProductDiscountPaymentModeEnumMap[instance.paymentMode],
      'priceLocale': instance.priceLocale,
      'subscriptionPeriod': instance.subscriptionPeriod,
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

const _$SKProductDiscountPaymentModeEnumMap = {
  SKProductDiscountPaymentMode.payAsYouGo: 0,
  SKProductDiscountPaymentMode.payUpFront: 1,
  SKProductDiscountPaymentMode.freeTrail: 2,
};
