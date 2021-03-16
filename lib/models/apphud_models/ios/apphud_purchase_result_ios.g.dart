// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_purchase_result_ios.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPurchaseResultIos _$ApphudPurchaseResultIosFromJson(
    Map<String, dynamic> json) {
  return ApphudPurchaseResultIos(
    subscription:
        Mapper.apphudSubscriptionWrapperFromJson(json['subscription']),
    nonRenewingPurchase:
        Mapper.apphudNonRenewingPurchaseFromJson(json['nonRenewingPurchase']),
    transaction:
        Mapper.skPaymentTransactionWrapperFromJson(json['transaction']),
  );
}

Map<String, dynamic> _$ApphudPurchaseResultIosToJson(
        ApphudPurchaseResultIos instance) =>
    <String, dynamic>{
      'subscription': instance.subscription,
      'nonRenewingPurchase': instance.nonRenewingPurchase,
      'transaction': instance.transaction,
    };
