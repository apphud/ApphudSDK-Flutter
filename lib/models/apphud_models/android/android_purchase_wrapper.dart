import 'package:json_annotation/json_annotation.dart';

part 'android_purchase_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class AndroidPurchaseWrapper {
  final int purchaseState;
  final int quantity; // TODO: Remove, not needed
  final int purchaseTime;
  final String developerPayload; // TODO: Remove, not needed
  final String orderId;
  final String originalJson; // TODO: Remove, not needed
  final String packageName; // TODO: Remove, not needed
  final String purchaseToken;
  final String signature;  // TODO: Remove, not needed
  final List<String> products; // TODO: ADD optional String productId, grab first element from array
  final bool isAcknowledged;  // TODO: Remove, not needed
  final bool isAutoRenewing; // TODO: Remove, not needed

  AndroidPurchaseWrapper({
    required this.orderId,
    required this.packageName,
    required this.purchaseState,
    required this.purchaseToken,
    required this.signature,
    required this.products,
    required this.originalJson,
    required this.purchaseTime,
    required this.developerPayload,
    required this.quantity,
    required this.isAcknowledged,
    required this.isAutoRenewing,
  });

  factory AndroidPurchaseWrapper.fromJson(Map<dynamic, dynamic> map) {
    return _$AndroidPurchaseWrapperFromJson(map);
  }

  Map<String, dynamic> toJson() => _$AndroidPurchaseWrapperToJson(this);

  @override
  String toString() {
    return 'AndroidPurchaseWrapper{purchaseState: $purchaseState, quantity: $quantity, purchaseTime: $purchaseTime, developerPayload: $developerPayload, orderId: $orderId, originalJson: $originalJson, packageName: $packageName, purchaseToken: $purchaseToken, signature: $signature, products: $products, isAcknowledged: $isAcknowledged, isAutoRenewing: $isAutoRenewing}';
  }
}
