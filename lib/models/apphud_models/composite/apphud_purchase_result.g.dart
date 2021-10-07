// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_purchase_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPurchaseResult _$ApphudPurchaseResultFromJson(Map json) =>
    ApphudPurchaseResult(
      subscription: json['subscription'] == null
          ? null
          : ApphudSubscriptionWrapper.fromJson(json['subscription'] as Map),
      nonRenewingPurchase: json['nonRenewingPurchase'] == null
          ? null
          : ApphudNonRenewingPurchase.fromJson(
              json['nonRenewingPurchase'] as Map),
      transaction: json['transaction'] == null
          ? null
          : SKPaymentTransactionWrapper.fromJson(json['transaction'] as Map),
      purchase: json['purchase'] == null
          ? null
          : AndroidPurchaseWrapper.fromJson(json['purchase'] as Map),
      error: json['error'] == null
          ? null
          : ApphudError.fromJson(json['error'] as Map),
    );

Map<String, dynamic> _$ApphudPurchaseResultToJson(
        ApphudPurchaseResult instance) =>
    <String, dynamic>{
      'subscription': instance.subscription,
      'nonRenewingPurchase': instance.nonRenewingPurchase,
      'transaction': instance.transaction,
      'purchase': instance.purchase,
      'error': instance.error,
    };
