import 'package:apphud/models/product_details/pricing_phase_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_offer_details.g.dart';

@JsonSerializable(anyMap: true)
class SubscriptionOfferDetailsWrapper {
  final String basePlanId;
  final List<String> offerTags;
  final String offerToken;
  final List<PricingPhaseWrapper> pricingPhases;
  final String? offerId;

  SubscriptionOfferDetailsWrapper({
    required this.basePlanId,
    required this.offerTags,
    required this.offerToken,
    required this.pricingPhases,
    this.offerId,
  });

  Map<String, dynamic> toJson() =>
      _$SubscriptionOfferDetailsWrapperToJson(this);

  factory SubscriptionOfferDetailsWrapper.fromJson(
          Map<dynamic, dynamic> json) =>
      _$SubscriptionOfferDetailsWrapperFromJson(json);

  @override
  String toString() {
    return 'SubscriptionOfferDetailsWrapper{basePlanId: $basePlanId, offerId: $offerId, offerTags: $offerTags, offerToken: $offerToken, pricingPhases: $pricingPhases}';
  }
}
