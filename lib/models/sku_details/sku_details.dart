import 'package:json_annotation/json_annotation.dart';

part 'sku_details.g.dart';

enum SkuType {
  @JsonValue('inapp')
  inapp,
  @JsonValue('subs')
  subs,
}

@JsonSerializable(anyMap: true)
class SkuDetailsWrapper {
  final String description;
  final String freeTrialPeriod;
  final String introductoryPrice;
  final int introductoryPriceAmountMicros;
  final int introductoryPriceCycles;
  final String introductoryPricePeriod;
  final String price;
  final int priceAmountMicros;
  final String priceCurrencyCode;
  final String sku;
  final String subscriptionPeriod;
  final String title;
  final SkuType type;
  final String originalPrice;
  final int originalPriceAmountMicros;

  SkuDetailsWrapper({
    required this.description,
    required this.freeTrialPeriod,
    required this.introductoryPrice,
    required this.introductoryPriceAmountMicros,
    required this.introductoryPriceCycles,
    required this.introductoryPricePeriod,
    required this.price,
    required this.priceAmountMicros,
    required this.priceCurrencyCode,
    required this.sku,
    required this.subscriptionPeriod,
    required this.title,
    required this.type,
    required this.originalPrice,
    required this.originalPriceAmountMicros,
  });

  factory SkuDetailsWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$SkuDetailsWrapperFromJson(map);

  Map<String, dynamic> toJson() => _$SkuDetailsWrapperToJson(this);

  @override
  String toString() {
    return 'SkuDetailsWrapper{description: $description, freeTrialPeriod: $freeTrialPeriod, introductoryPrice: $introductoryPrice, introductoryPriceAmountMicros: $introductoryPriceAmountMicros, introductoryPriceCycles: $introductoryPriceCycles, introductoryPricePeriod: $introductoryPricePeriod, price: $price, priceAmountMicros: $priceAmountMicros, priceCurrencyCode: $priceCurrencyCode, sku: $sku, subscriptionPeriod: $subscriptionPeriod, title: $title, type: $type, originalPrice: $originalPrice, originalPriceAmountMicros: $originalPriceAmountMicros}';
  }
}
