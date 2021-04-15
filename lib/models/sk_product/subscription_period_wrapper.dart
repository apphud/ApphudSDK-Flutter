import 'dart:ui';

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

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    final SKProductSubscriptionPeriodWrapper typedOther =
        other as SKProductSubscriptionPeriodWrapper;
    return typedOther.numberOfUnits == numberOfUnits && typedOther.unit == unit;
  }

  @override
  int get hashCode => hashValues(this.numberOfUnits, this.unit);

  @override
  String toString() {
    return 'SKProductSubscriptionPeriodWrapper{numberOfUnits: $numberOfUnits, unit: $unit}';
  }
}
