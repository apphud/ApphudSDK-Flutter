import 'package:apphud/models/sk_product/subscription_period_time_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_period_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class SKProductSubscriptionPeriodWrapper {
  final int numberOfUnits;
  final SKSubscriptionPeriodTime unit;

  SKProductSubscriptionPeriodWrapper({
    required this.numberOfUnits,
    required this.unit,
  });

  factory SKProductSubscriptionPeriodWrapper.fromJson(
    Map<dynamic, dynamic> map,
  ) =>
      _$SKProductSubscriptionPeriodWrapperFromJson(map);

  Map<String, dynamic> toJson() =>
      _$SKProductSubscriptionPeriodWrapperToJson(this);

  @override
  String toString() {
    return 'SKProductSubscriptionPeriodWrapper{numberOfUnits: $numberOfUnits, unit: $unit}';
  }
}
