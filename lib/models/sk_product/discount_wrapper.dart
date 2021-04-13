import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sk_product/subscription_period_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../mapper.dart';
import 'discount_payment_mode_wrapper.dart';

part 'discount_wrapper.g.dart';

@JsonSerializable()
class SKProductDiscountWrapper {
  final String? price;
  final int? numberOfPeriods;
  final SKProductDiscountPaymentMode? paymentMode;
  @JsonKey(fromJson: Mapper.skPriceLocaleFromJson)
  final SKPriceLocaleWrapper? priceLocale;
  @JsonKey(fromJson: Mapper.skProductSubscriptionPeriodFromJson)
  final SKProductSubscriptionPeriodWrapper? subscriptionPeriod;

  SKProductDiscountWrapper({
    required this.price,
    required this.numberOfPeriods,
    required this.paymentMode,
    required this.priceLocale,
    required this.subscriptionPeriod,
  });

  factory SKProductDiscountWrapper.fromJson(Map<String, dynamic> map) =>
      _$SKProductDiscountWrapperFromJson(map);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    final SKProductDiscountWrapper typedOther =
        other as SKProductDiscountWrapper;
    return typedOther.price == price &&
        typedOther.priceLocale == priceLocale &&
        typedOther.numberOfPeriods == numberOfPeriods &&
        typedOther.paymentMode == paymentMode &&
        typedOther.subscriptionPeriod == subscriptionPeriod;
  }

  @override
  int get hashCode => hashValues(this.price, this.priceLocale,
      this.numberOfPeriods, this.paymentMode, this.subscriptionPeriod);
}
