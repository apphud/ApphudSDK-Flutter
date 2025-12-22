// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_paywall_screen_show_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPaywallScreenShowResult _$ApphudPaywallScreenShowResultFromJson(
        Map json) =>
    ApphudPaywallScreenShowResult(
      success: json['success'] as bool? ?? false,
      userClosed: json['userClosed'] as bool? ?? false,
      error: json['error'] == null
          ? null
          : ApphudError.fromJson(json['error'] as Map),
      subscription: json['subscription'] == null
          ? null
          : ApphudSubscriptionWrapper.fromJson(json['subscription'] as Map),
      nonRenewingPurchase: json['nonRenewingPurchase'] == null
          ? null
          : ApphudNonRenewingPurchase.fromJson(
              json['nonRenewingPurchase'] as Map),
      purchase: json['purchase'] == null
          ? null
          : AndroidPurchaseWrapper.fromJson(json['purchase'] as Map),
      transaction: json['transaction'] == null
          ? null
          : SKPaymentTransactionWrapper.fromJson(json['transaction'] as Map),
    );

Map<String, dynamic> _$ApphudPaywallScreenShowResultToJson(
        ApphudPaywallScreenShowResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'userClosed': instance.userClosed,
      'error': instance.error,
      'subscription': instance.subscription,
      'nonRenewingPurchase': instance.nonRenewingPurchase,
      'purchase': instance.purchase,
      'transaction': instance.transaction,
    };
