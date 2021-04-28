import 'package:json_annotation/json_annotation.dart';

part 'apphud_purchase_result_android.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPurchaseResultAndroid {
  final String orderId;
  final String packageName;
  final String purchaseToken;
  final String signature;
  final String sku;
  final String originalJson;
  final int purchaseState;
  final int purchaseTime;

  ApphudPurchaseResultAndroid({
    required this.orderId,
    required this.packageName,
    required this.purchaseState,
    required this.purchaseToken,
    required this.signature,
    required this.sku,
    required this.originalJson,
    required this.purchaseTime,
  });

  factory ApphudPurchaseResultAndroid.fromJson(Map<dynamic, dynamic> map) {
    return _$ApphudPurchaseResultAndroidFromJson(map);
  }

  @override
  String toString() {
    return 'ApphudPurchaseResultAndroid{orderId: $orderId, packageName: $packageName, purchaseToken: $purchaseToken, signature: $signature, sku: $sku, originalJson: $originalJson, purchaseState: $purchaseState, purchaseTime: $purchaseTime}';
  }
}
