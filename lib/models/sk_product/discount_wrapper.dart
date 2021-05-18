import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sk_product/subscription_period_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

import 'discount_payment_mode_wrapper.dart';

part 'discount_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class SKProductDiscountWrapper {
  final String price;
  final int numberOfPeriods;
  final SKProductDiscountPaymentMode paymentMode;
  final SKPriceLocaleWrapper priceLocale;
  final SKProductSubscriptionPeriodWrapper subscriptionPeriod;

  SKProductDiscountWrapper({
    required this.price,
    required this.numberOfPeriods,
    required this.paymentMode,
    required this.priceLocale,
    required this.subscriptionPeriod,
  });

  factory SKProductDiscountWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$SKProductDiscountWrapperFromJson(map);

  Map<String, dynamic> toJson() => _$SKProductDiscountWrapperToJson(this);

  @override
  String toString() {
    return 'SKProductDiscountWrapper{price: $price, numberOfPeriods: $numberOfPeriods, paymentMode: $paymentMode, priceLocale: $priceLocale, subscriptionPeriod: $subscriptionPeriod}';
  }
}