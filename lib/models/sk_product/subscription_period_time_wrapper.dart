import 'package:json_annotation/json_annotation.dart';

enum SKSubscriptionPeriodTime {
  @JsonValue(0)
  day,
  @JsonValue(1)
  week,
  @JsonValue(2)
  month,
  @JsonValue(3)
  year,
}
