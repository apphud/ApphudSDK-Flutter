import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sk_product/subscription_period_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

import 'discount_payment_mode_wrapper.dart';
import 'discount_type_wrapper.dart';

part 'discount_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class SKProductDiscountWrapper {
  /// Identifier of the discount. Non-null only for promotional offers
  /// (`type == SKProductDiscountType.subscription`); `null` for introductory
  /// offers. This is the value to pass as `discountID` into
  /// `Apphud.purchasePromo`.
  final String? identifier;

  /// Discount type: introductory vs promotional (subscription) offer.
  final SKProductDiscountType? type;

  final double price;
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
    this.identifier,
    this.type,
  });

  factory SKProductDiscountWrapper.fromJson(Map<dynamic, dynamic> map) =>
      _$SKProductDiscountWrapperFromJson(map);

  Map<String, dynamic> toJson() => _$SKProductDiscountWrapperToJson(this);

  @override
  String toString() {
    return 'SKProductDiscountWrapper{identifier: $identifier, type: $type, price: $price, numberOfPeriods: $numberOfPeriods, paymentMode: $paymentMode, priceLocale: $priceLocale, subscriptionPeriod: $subscriptionPeriod}';
  }
}
