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
      products:
          (json['products'] as List<dynamic>).map((e) => e as String).toList(),
      originalJson: json['originalJson'] as String,
      purchaseTime: json['purchaseTime'] as int,
      accountIdentifiers: json['accountIdentifiers'] == null
          ? null
          : AndroidAccountIdentifiersWrapper.fromJson(
              json['accountIdentifiers'] as Map),
      developerPayload: json['developerPayload'] as String,
      quantity: json['quantity'] as int,
      isAcknowledged: json['isAcknowledged'] as bool,
      isAutoRenewing: json['isAutoRenewing'] as bool,
    );

Map<String, dynamic> _$AndroidPurchaseWrapperToJson(
        AndroidPurchaseWrapper instance) =>
    <String, dynamic>{
      'purchaseState': instance.purchaseState,
      'quantity': instance.quantity,
      'purchaseTime': instance.purchaseTime,
      'accountIdentifiers': instance.accountIdentifiers,
      'developerPayload': instance.developerPayload,
      'orderId': instance.orderId,
      'originalJson': instance.originalJson,
      'packageName': instance.packageName,
      'purchaseToken': instance.purchaseToken,
      'signature': instance.signature,
      'products': instance.products,
      'isAcknowledged': instance.isAcknowledged,
      'isAutoRenewing': instance.isAutoRenewing,
    };
