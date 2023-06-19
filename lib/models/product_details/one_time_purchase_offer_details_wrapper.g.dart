// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_time_purchase_offer_details_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneTimePurchaseOfferDetailsWrapper _$OneTimePurchaseOfferDetailsWrapperFromJson(
        Map json) =>
    OneTimePurchaseOfferDetailsWrapper(
      formattedPrice: json['formattedPrice'] as String,
      priceAmountMicros: json['priceAmountMicros'] as int,
      priceCurrencyCode: json['priceCurrencyCode'] as String,
    );

Map<String, dynamic> _$OneTimePurchaseOfferDetailsWrapperToJson(
        OneTimePurchaseOfferDetailsWrapper instance) =>
    <String, dynamic>{
      'formattedPrice': instance.formattedPrice,
      'priceAmountMicros': instance.priceAmountMicros,
      'priceCurrencyCode': instance.priceCurrencyCode,
    };
