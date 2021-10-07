// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_purchase_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AndroidPurchaseWrapper _$AndroidPurchaseWrapperFromJson(Map json) =>
    AndroidPurchaseWrapper(
      orderId: json['orderId'] as String,
      packageName: json['packageName'] as String,
      purchaseState: json['purchaseState'] as int,
      purchaseToken: json['purchaseToken'] as String,
      signature: json['signature'] as String,
      skus: (json['skus'] as List<dynamic>).map((e) => e as String).toList(),
      originalJson: json['originalJson'] as String,
      purchaseTime: json['purchaseTime'] as int,
    );

Map<String, dynamic> _$AndroidPurchaseWrapperToJson(
        AndroidPurchaseWrapper instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'packageName': instance.packageName,
      'purchaseToken': instance.purchaseToken,
      'signature': instance.signature,
      'skus': instance.skus,
      'originalJson': instance.originalJson,
      'purchaseState': instance.purchaseState,
      'purchaseTime': instance.purchaseTime,
    };
