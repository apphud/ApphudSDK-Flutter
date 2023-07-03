// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_phase_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricingPhaseWrapper _$PricingPhaseWrapperFromJson(Map json) =>
    PricingPhaseWrapper(
      billingCycleCount: json['billingCycleCount'] as int,
      billingPeriod: json['billingPeriod'] as String,
      formattedPrice: json['formattedPrice'] as String,
      priceAmountMicros: json['priceAmountMicros'] as int,
      priceCurrencyCode: json['priceCurrencyCode'] as String,
      recurrenceMode: json['recurrenceMode'] as int,
    );

Map<String, dynamic> _$PricingPhaseWrapperToJson(
        PricingPhaseWrapper instance) =>
    <String, dynamic>{
      'billingCycleCount': instance.billingCycleCount,
      'billingPeriod': instance.billingPeriod,
      'formattedPrice': instance.formattedPrice,
      'priceAmountMicros': instance.priceAmountMicros,
      'priceCurrencyCode': instance.priceCurrencyCode,
      'recurrenceMode': instance.recurrenceMode,
    };
