import 'dart:ui' show hashValues;

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sku_details.g.dart';


enum SkuType {

@JsonValue('inapp')
inapp,
@JsonValue('subs')
subs,
}

@JsonSerializable()
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
    @required this.description,
    @required this.freeTrialPeriod,
    @required this.introductoryPrice,
    @required this.introductoryPriceAmountMicros,
    @required this.introductoryPriceCycles,
    @required this.introductoryPricePeriod,
    @required this.price,
    @required this.priceAmountMicros,
    @required this.priceCurrencyCode,
    @required this.sku,
    @required this.subscriptionPeriod,
    @required this.title,
    @required this.type,
    @required this.originalPrice,
    @required this.originalPriceAmountMicros,
  });

  factory SkuDetailsWrapper.fromJson(Map map) =>
      _$SkuDetailsWrapperFromJson(map);

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }

    final SkuDetailsWrapper typedOther = other;
    return typedOther is SkuDetailsWrapper &&
        typedOther.description == description &&
        typedOther.freeTrialPeriod == freeTrialPeriod &&
        typedOther.introductoryPrice == introductoryPrice &&
        typedOther.introductoryPriceAmountMicros ==
            introductoryPriceAmountMicros &&
        typedOther.introductoryPriceCycles == introductoryPriceCycles &&
        typedOther.introductoryPricePeriod == introductoryPricePeriod &&
        typedOther.price == price &&
        typedOther.priceAmountMicros == priceAmountMicros &&
        typedOther.sku == sku &&
        typedOther.subscriptionPeriod == subscriptionPeriod &&
        typedOther.title == title &&
        typedOther.type == type &&
        typedOther.originalPrice == originalPrice &&
        typedOther.originalPriceAmountMicros == originalPriceAmountMicros;
  }

  @override
  int get hashCode {
    return hashValues(
        description.hashCode,
        freeTrialPeriod.hashCode,
        introductoryPrice.hashCode,
        introductoryPriceAmountMicros.hashCode,
        introductoryPriceCycles.hashCode,
        introductoryPricePeriod.hashCode,
        price.hashCode,
        priceAmountMicros.hashCode,
        sku.hashCode,
        subscriptionPeriod.hashCode,
        title.hashCode,
        type.hashCode,
        originalPrice,
        originalPriceAmountMicros);
  }
}