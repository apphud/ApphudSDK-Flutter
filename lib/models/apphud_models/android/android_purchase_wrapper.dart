import 'package:apphud/models/apphud_models/android/android_account_identifiers_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'android_purchase_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class AndroidPurchaseWrapper {
  final int purchaseState;
  final int quantity;
  final int purchaseTime;
  final List<AndroidAccountIdentifiersWrapper>? accountIdentifiers;
  final String developerPayload;
  final String orderId;
  final String originalJson;
  final String packageName;
  final String purchaseToken;
  final String signature;
  final List<String> products;
  final bool isAcknowledged;
  final bool isAutoRenewing;

  AndroidPurchaseWrapper({
    required this.orderId,
    required this.packageName,
    required this.purchaseState,
    required this.purchaseToken,
    required this.signature,
    required this.products,
    required this.originalJson,
    required this.purchaseTime,
    required this.accountIdentifiers,
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
    return 'AndroidPurchaseWrapper{purchaseState: $purchaseState, quantity: $quantity, purchaseTime: $purchaseTime, accountIdentifiers: $accountIdentifiers, developerPayload: $developerPayload, orderId: $orderId, originalJson: $originalJson, packageName: $packageName, purchaseToken: $purchaseToken, signature: $signature, products: $products, isAcknowledged: $isAcknowledged, isAutoRenewing: $isAutoRenewing}';
  }
}
