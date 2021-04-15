// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sk_product_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SKProductWrapper _$SKProductWrapperFromJson(Map json) {
  return SKProductWrapper(
    productIdentifier: json['productIdentifier'] as String,
    localizedTitle: json['localizedTitle'] as String,
    localizedDescription: json['localizedDescription'] as String,
    subscriptionGroupIdentifier: json['subscriptionGroupIdentifier'] as String?,
    price: json['price'] as String,
    priceLocale: SKPriceLocaleWrapper.fromJson(json['priceLocale'] as Map),
    subscriptionPeriod: json['subscriptionPeriod'] == null
        ? null
        : SKProductSubscriptionPeriodWrapper.fromJson(
            json['subscriptionPeriod'] as Map),
    introductoryPrice: json['introductoryPrice'] == null
        ? null
        : SKProductDiscountWrapper.fromJson(json['introductoryPrice'] as Map),
  );
}

Map<String, dynamic> _$SKProductWrapperToJson(SKProductWrapper instance) =>
    <String, dynamic>{
      'productIdentifier': instance.productIdentifier,
      'localizedTitle': instance.localizedTitle,
      'localizedDescription': instance.localizedDescription,
      'subscriptionGroupIdentifier': instance.subscriptionGroupIdentifier,
      'price': instance.price,
      'priceLocale': instance.priceLocale,
      'subscriptionPeriod': instance.subscriptionPeriod,
      'introductoryPrice': instance.introductoryPrice,
    };

SKPriceLocaleWrapper _$SKPriceLocaleWrapperFromJson(Map json) {
  return SKPriceLocaleWrapper(
    currencySymbol: json['currencySymbol'] as String,
    currencyCode: json['currencyCode'] as String,
  );
}

Map<String, dynamic> _$SKPriceLocaleWrapperToJson(
        SKPriceLocaleWrapper instance) =>
    <String, dynamic>{
      'currencySymbol': instance.currencySymbol,
      'currencyCode': instance.currencyCode,
    };
