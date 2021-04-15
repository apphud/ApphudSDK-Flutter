import 'package:apphud/models/sk_product/subscription_period_wrapper.dart';
import 'package:flutter/cupertino.dart';
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

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    final SKProductWrapper typedOther = other as SKProductWrapper;
    return typedOther.productIdentifier == productIdentifier &&
        typedOther.localizedTitle == localizedTitle &&
        typedOther.localizedDescription == localizedDescription &&
        typedOther.priceLocale == priceLocale &&
        typedOther.subscriptionGroupIdentifier == subscriptionGroupIdentifier &&
        typedOther.price == price &&
        typedOther.subscriptionPeriod == subscriptionPeriod &&
        typedOther.introductoryPrice == introductoryPrice;
  }

  @override
  int get hashCode => hashValues(
      this.productIdentifier,
      this.localizedTitle,
      this.localizedDescription,
      this.priceLocale,
      this.subscriptionGroupIdentifier,
      this.price,
      this.subscriptionPeriod,
      this.introductoryPrice);

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

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    final SKPriceLocaleWrapper typedOther = other as SKPriceLocaleWrapper;
    return typedOther.currencySymbol == currencySymbol &&
        typedOther.currencyCode == currencyCode;
  }

  @override
  int get hashCode => hashValues(this.currencySymbol, this.currencyCode);

  @override
  String toString() {
    return 'SKPriceLocaleWrapper{currencySymbol: $currencySymbol, currencyCode: $currencyCode}';
  }
}
