import 'package:apphud/models/sk_product/subscription_period_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../mapper.dart';
import 'discount_wrapper.dart';

part 'sk_product_wrapper.g.dart';

@JsonSerializable()
class SKProductWrapper {
  final String? productIdentifier;
  final String? localizedTitle;
  final String? localizedDescription;
  final String? subscriptionGroupIdentifier;
  final String? price;

  @JsonKey(fromJson: Mapper.skPriceLocaleFromJson)
  final SKPriceLocaleWrapper? priceLocale;
  @JsonKey(fromJson: Mapper.skProductSubscriptionPeriodFromJson)
  final SKProductSubscriptionPeriodWrapper? subscriptionPeriod;
  @JsonKey(fromJson: Mapper.skProductDiscountFromJson)
  final SKProductDiscountWrapper? introductoryPrice;

  SKProductWrapper({
    required this.productIdentifier,
    required this.localizedTitle,
    required this.localizedDescription,
    required this.subscriptionGroupIdentifier,
    required this.price,
    required this.priceLocale,
    required this.subscriptionPeriod,
    required this.introductoryPrice,
  });

  factory SKProductWrapper.fromJson(Map<String, dynamic> map) =>
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
}

@JsonSerializable()
class SKPriceLocaleWrapper {
  final String? currencySymbol;
  final String? currencyCode;

  SKPriceLocaleWrapper({
    required this.currencySymbol,
    required this.currencyCode,
  });

  factory SKPriceLocaleWrapper.fromJson(Map<String, dynamic> map) =>
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
}
