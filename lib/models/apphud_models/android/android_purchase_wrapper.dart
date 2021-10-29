import 'package:json_annotation/json_annotation.dart';

part 'android_purchase_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class AndroidPurchaseWrapper {
  final String orderId;
  final String packageName;
  final String purchaseToken;
  final String signature;
  final List<String> skus;
  final String originalJson;
  final int purchaseState;
  final int purchaseTime;

  AndroidPurchaseWrapper({
    required this.orderId,
    required this.packageName,
    required this.purchaseState,
    required this.purchaseToken,
    required this.signature,
    required this.skus,
    required this.originalJson,
    required this.purchaseTime,
  });

  factory AndroidPurchaseWrapper.fromJson(Map<dynamic, dynamic> map) {
    return _$AndroidPurchaseWrapperFromJson(map);
  }

  Map<String, dynamic> toJson() => _$AndroidPurchaseWrapperToJson(this);

  @override
  String toString() {
    return 'ApphudPurchaseResultAndroid{orderId: $orderId, packageName: $packageName, purchaseToken: $purchaseToken, signature: $signature, skus: $skus, originalJson: $originalJson, purchaseState: $purchaseState, purchaseTime: $purchaseTime}';
  }
}
