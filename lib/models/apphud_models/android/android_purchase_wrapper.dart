import 'package:json_annotation/json_annotation.dart';

part 'android_purchase_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class AndroidPurchaseWrapper {
  final int purchaseState;
  final int purchaseTime;
  final String orderId;
  final String purchaseToken;
  final String? productId;

  AndroidPurchaseWrapper({
    required this.orderId,
    required this.purchaseState,
    required this.purchaseToken,
    required this.productId,
    required this.purchaseTime,
  });

  factory AndroidPurchaseWrapper.fromJson(Map<dynamic, dynamic> map) {
    return _$AndroidPurchaseWrapperFromJson(map);
  }

  Map<String, dynamic> toJson() => _$AndroidPurchaseWrapperToJson(this);

  @override
  String toString() {
    return 'AndroidPurchaseWrapper{purchaseState: $purchaseState, purchaseTime: $purchaseTime, orderId: $orderId, purchaseToken: $purchaseToken, productId: $productId}';
  }
}
