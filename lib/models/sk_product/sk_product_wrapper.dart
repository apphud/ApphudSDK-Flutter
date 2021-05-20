import 'package:apphud/models/sk_product/subscription_period_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

import 'discount_wrapper.dart';

part 'sk_product_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class SKProductWrapper {
  final String productIdentifier;
  final String localizedTitle;
  final String localizedDescription;
  final String price;
  final SKPriceLocaleWrapper priceLocale;
  final SKProductSubscriptionPeriodWrapper? subscriptionPeriod;
  final SKProductDiscountWrapper? introductoryPrice;
  final String? subscriptionGroupIdentifier;

  SKProductWrapper({
    required this.productIdentifier,
    required this.localizedTitle,
    required this.localizedDescription,
    required this.price,
    required this.priceLocale,
    this.subscriptionPeriod,
    this.introductoryPrice,
    this.subscriptionGroupIdentifier,
  });

  factory SKProductWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$SKProductWrapperFromJson(map);

  Map<String, dynamic> toJson() => _$SKProductWrapperToJson(this);

  @override
  String toString() {
    return 'SKProductWrapper{productIdentifier: $productIdentifier, localizedTitle: $localizedTitle, localizedDescription: $localizedDescription, price: $price, priceLocale: $priceLocale, subscriptionPeriod: $subscriptionPeriod, introductoryPrice: $introductoryPrice, subscriptionGroupIdentifier: $subscriptionGroupIdentifier}';
  }
}

@JsonSerializable(anyMap: true)
class SKPriceLocaleWrapper {
  final String? currencySymbol;
  final String? currencyCode;

  SKPriceLocaleWrapper({
    required this.currencySymbol,
    required this.currencyCode,
  });

  factory SKPriceLocaleWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$SKPriceLocaleWrapperFromJson(map);

  Map<String, dynamic> toJson() => _$SKPriceLocaleWrapperToJson(this);

  @override
  String toString() {
    return 'SKPriceLocaleWrapper{currencySymbol: $currencySymbol, currencyCode: $currencyCode}';
  }
}
