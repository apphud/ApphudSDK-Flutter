import 'package:json_annotation/json_annotation.dart';

part 'apphud_purchase_result_android.g.dart';

@JsonSerializable()
class ApphudPurchaseResultAndroid {
  String orderId;
  String packageName;
  String purchaseToken;
  String signature;
  String sku;
  String originalJson;
  int purchaseState;
  int purchaseTime;

  ApphudPurchaseResultAndroid(
    this.orderId,
    this.packageName,
    this.purchaseState,
    this.purchaseToken,
    this.signature,
    this.sku,
    this.originalJson,
    this.purchaseTime,
  );

  factory ApphudPurchaseResultAndroid.fromJson(Map map) {
    assert(map != null, 'Map must not be null.');
    return _$ApphudPurchaseResultAndroidFromJson(map);
  }
}
