// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_offer_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionOfferDetailsWrapper _$SubscriptionOfferDetailsWrapperFromJson(
        Map json) =>
    SubscriptionOfferDetailsWrapper(
      basePlanId: json['basePlanId'] as String,
      offerTags:
          (json['offerTags'] as List<dynamic>).map((e) => e as String).toList(),
      offerToken: json['offerToken'] as String,
      pricingPhases: (json['pricingPhases'] as List<dynamic>)
          .map((e) => PricingPhaseWrapper.fromJson(e as Map))
          .toList(),
      offerId: json['offerId'] as String?,
    );

Map<String, dynamic> _$SubscriptionOfferDetailsWrapperToJson(
        SubscriptionOfferDetailsWrapper instance) =>
    <String, dynamic>{
      'basePlanId': instance.basePlanId,
      'offerTags': instance.offerTags,
      'offerToken': instance.offerToken,
      'pricingPhases': instance.pricingPhases,
      'offerId': instance.offerId,
    };
