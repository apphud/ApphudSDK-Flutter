// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_purchase_result_android.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPurchaseResultAndroid _$ApphudPurchaseResultAndroidFromJson(Map json) {
  return ApphudPurchaseResultAndroid(
    orderId: json['orderId'] as String,
    packageName: json['packageName'] as String,
    purchaseState: json['purchaseState'] as int,
    purchaseToken: json['purchaseToken'] as String,
    signature: json['signature'] as String,
    sku: json['sku'] as String,
    originalJson: json['originalJson'] as String,
    purchaseTime: json['purchaseTime'] as int,
  );
}

Map<String, dynamic> _$ApphudPurchaseResultAndroidToJson(
        ApphudPurchaseResultAndroid instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'packageName': instance.packageName,
      'purchaseToken': instance.purchaseToken,
      'signature': instance.signature,
      'sku': instance.sku,
      'originalJson': instance.originalJson,
      'purchaseState': instance.purchaseState,
      'purchaseTime': instance.purchaseTime,
    };
