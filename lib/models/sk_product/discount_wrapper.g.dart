// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKProductDiscountWrapper _$SKProductDiscountWrapperFromJson(Map json) =>
    SKProductDiscountWrapper(
      price: (json['price'] as num).toDouble(),
      numberOfPeriods: (json['numberOfPeriods'] as num).toInt(),
      paymentMode: $enumDecode(
          _$SKProductDiscountPaymentModeEnumMap, json['paymentMode']),
      priceLocale: SKPriceLocaleWrapper.fromJson(json['priceLocale'] as Map),
      subscriptionPeriod: SKProductSubscriptionPeriodWrapper.fromJson(
          json['subscriptionPeriod'] as Map),
      identifier: json['identifier'] as String?,
      type: $enumDecodeNullable(_$SKProductDiscountTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$SKProductDiscountWrapperToJson(
        SKProductDiscountWrapper instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'type': _$SKProductDiscountTypeEnumMap[instance.type],
      'price': instance.price,
      'numberOfPeriods': instance.numberOfPeriods,
      'paymentMode':
          _$SKProductDiscountPaymentModeEnumMap[instance.paymentMode]!,
      'priceLocale': instance.priceLocale,
      'subscriptionPeriod': instance.subscriptionPeriod,
    };

const _$SKProductDiscountPaymentModeEnumMap = {
  SKProductDiscountPaymentMode.payAsYouGo: 0,
  SKProductDiscountPaymentMode.payUpFront: 1,
  SKProductDiscountPaymentMode.freeTrail: 2,
};

const _$SKProductDiscountTypeEnumMap = {
  SKProductDiscountType.introductory: 0,
  SKProductDiscountType.subscription: 1,
};
