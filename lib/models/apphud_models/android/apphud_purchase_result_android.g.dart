// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_purchase_result_android.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPurchaseResultAndroid _$ApphudPurchaseResultAndroidFromJson(
    Map<String, dynamic> json) {
  return ApphudPurchaseResultAndroid(
    json['orderId'] as String,
    json['packageName'] as String,
    json['purchaseState'] as int,
    json['purchaseToken'] as String,
    json['signature'] as String,
    json['sku'] as String,
    json['originalJson'] as String,
    json['purchaseTime'] as int,
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
