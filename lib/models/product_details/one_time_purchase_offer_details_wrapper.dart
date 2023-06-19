import 'package:json_annotation/json_annotation.dart';

part 'one_time_purchase_offer_details_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class OneTimePurchaseOfferDetailsWrapper {
  final String formattedPrice;
  final int priceAmountMicros;
  final String priceCurrencyCode;

  OneTimePurchaseOfferDetailsWrapper({
    required this.formattedPrice,
    required this.priceAmountMicros,
    required this.priceCurrencyCode,
  });

  Map<String, dynamic> toJson() =>
      _$OneTimePurchaseOfferDetailsWrapperToJson(this);

  factory OneTimePurchaseOfferDetailsWrapper.fromJson(
          Map<dynamic, dynamic> json) =>
      _$OneTimePurchaseOfferDetailsWrapperFromJson(json);

  @override
  String toString() {
    return 'OneTimePurchaseOfferDetailsWrapper{formattedPrice: $formattedPrice, priceAmountMicros: $priceAmountMicros, priceCurrencyCode: $priceCurrencyCode}';
  }
}
