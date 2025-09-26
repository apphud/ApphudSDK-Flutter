// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_paywall_screen_show_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPaywallScreenShowResult _$ApphudPaywallScreenShowResultFromJson(
        Map json) =>
    ApphudPaywallScreenShowResult(
      success: json['success'] as bool,
      userClosed: json['userClosed'] as bool,
      error: json['error'] == null
          ? null
          : ApphudError.fromJson(json['error'] as Map),
      purchaseResult: json['purchaseResult'] == null
          ? null
          : ApphudPurchaseResult.fromJson(json['purchaseResult'] as Map),
    );

Map<String, dynamic> _$ApphudPaywallScreenShowResultToJson(
        ApphudPaywallScreenShowResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'userClosed': instance.userClosed,
      'purchaseResult': instance.purchaseResult,
    };
