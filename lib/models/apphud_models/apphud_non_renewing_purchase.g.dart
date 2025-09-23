// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_non_renewing_purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudNonRenewingPurchase _$ApphudNonRenewingPurchaseFromJson(Map json) =>
    ApphudNonRenewingPurchase(
      productId: json['productId'] as String,
      purchasedAt: (json['purchasedAt'] as num).toDouble(),
      isActive: json['isActive'] as bool,
      canceledAt: (json['canceledAt'] as num?)?.toDouble(),
      purchaseToken: json['purchaseToken'] as String?,
      platform: json['platform'] as String?,
    );

Map<String, dynamic> _$ApphudNonRenewingPurchaseToJson(
    ApphudNonRenewingPurchase instance) {
  final val = <String, dynamic>{
    'productId': instance.productId,
    'purchasedAt': instance.purchasedAt,
    'canceledAt': instance.canceledAt,
    'isActive': instance.isActive,
    'purchaseToken': instance.purchaseToken,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('platform', instance.platform);
  return val;
}
