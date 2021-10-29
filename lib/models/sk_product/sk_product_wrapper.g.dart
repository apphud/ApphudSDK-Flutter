// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sk_product_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKProductWrapper _$SKProductWrapperFromJson(Map json) => SKProductWrapper(
      productIdentifier: json['productIdentifier'] as String,
      localizedTitle: json['localizedTitle'] as String,
      localizedDescription: json['localizedDescription'] as String,
      price: json['price'] as String,
      priceLocale: SKPriceLocaleWrapper.fromJson(json['priceLocale'] as Map),
      subscriptionPeriod: json['subscriptionPeriod'] == null
          ? null
          : SKProductSubscriptionPeriodWrapper.fromJson(
              json['subscriptionPeriod'] as Map),
      introductoryPrice: json['introductoryPrice'] == null
          ? null
          : SKProductDiscountWrapper.fromJson(json['introductoryPrice'] as Map),
      subscriptionGroupIdentifier:
          json['subscriptionGroupIdentifier'] as String?,
    );

Map<String, dynamic> _$SKProductWrapperToJson(SKProductWrapper instance) =>
    <String, dynamic>{
      'productIdentifier': instance.productIdentifier,
      'localizedTitle': instance.localizedTitle,
      'localizedDescription': instance.localizedDescription,
      'price': instance.price,
      'priceLocale': instance.priceLocale,
      'subscriptionPeriod': instance.subscriptionPeriod,
      'introductoryPrice': instance.introductoryPrice,
      'subscriptionGroupIdentifier': instance.subscriptionGroupIdentifier,
    };

SKPriceLocaleWrapper _$SKPriceLocaleWrapperFromJson(Map json) =>
    SKPriceLocaleWrapper(
      currencySymbol: json['currencySymbol'] as String?,
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$SKPriceLocaleWrapperToJson(
        SKPriceLocaleWrapper instance) =>
    <String, dynamic>{
      'currencySymbol': instance.currencySymbol,
      'currencyCode': instance.currencyCode,
    };
