import 'package:json_annotation/json_annotation.dart';

part 'pricing_phase_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class PricingPhaseWrapper {
  final int billingCycleCount;
  final String billingPeriod;
  final String formattedPrice;
  final int priceAmountMicros;
  final String priceCurrencyCode;
  final int recurrenceMode;

  PricingPhaseWrapper({
    required this.billingCycleCount,
    required this.billingPeriod,
    required this.formattedPrice,
    required this.priceAmountMicros,
    required this.priceCurrencyCode,
    required this.recurrenceMode,
  });

  Map<String, dynamic> toJson() => _$PricingPhaseWrapperToJson(this);

  factory PricingPhaseWrapper.fromJson(Map<dynamic, dynamic> json) =>
      _$PricingPhaseWrapperFromJson(json);

  @override
  String toString() {
    return 'PricingPhaseWrapper{billingCycleCount: $billingCycleCount, billingPeriod: $billingPeriod, formattedPrice: $formattedPrice, priceAmountMicros: $priceAmountMicros, priceCurrencyCode: $priceCurrencyCode, recurrenceMode: $recurrenceMode}';
  }
}
