import 'package:json_annotation/json_annotation.dart';

enum SKProductDiscountPaymentMode {
  @JsonValue(0)
  payAsYouGo,
  @JsonValue(1)
  payUpFront,
  @JsonValue(2)
  freeTrail,
}
