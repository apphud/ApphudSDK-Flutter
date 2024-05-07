// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_purchase_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AndroidPurchaseWrapper _$AndroidPurchaseWrapperFromJson(Map json) =>
    AndroidPurchaseWrapper(
      orderId: json['orderId'] as String,
      purchaseState: (json['purchaseState'] as num).toInt(),
      purchaseToken: json['purchaseToken'] as String,
      productId: json['productId'] as String?,
      purchaseTime: (json['purchaseTime'] as num).toInt(),
    );

Map<String, dynamic> _$AndroidPurchaseWrapperToJson(
        AndroidPurchaseWrapper instance) =>
    <String, dynamic>{
      'purchaseState': instance.purchaseState,
      'purchaseTime': instance.purchaseTime,
      'orderId': instance.orderId,
      'purchaseToken': instance.purchaseToken,
      'productId': instance.productId,
    };
