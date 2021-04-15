// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_purchase_result_ios.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPurchaseResultIos _$ApphudPurchaseResultIosFromJson(Map json) {
  return ApphudPurchaseResultIos(
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
  );
}

Map<String, dynamic> _$ApphudPurchaseResultIosToJson(
        ApphudPurchaseResultIos instance) =>
    <String, dynamic>{
      'subscription': instance.subscription,
      'nonRenewingPurchase': instance.nonRenewingPurchase,
      'transaction': instance.transaction,
    };
