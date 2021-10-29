// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_paywalls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPaywalls _$ApphudPaywallsFromJson(Map json) => ApphudPaywalls(
      paywalls: (json['paywalls'] as List<dynamic>?)
          ?.map((e) => ApphudPaywall.fromJson(e as Map))
          .toList(),
      error: json['error'] == null
          ? null
          : ApphudError.fromJson(json['error'] as Map),
    );

Map<String, dynamic> _$ApphudPaywallsToJson(ApphudPaywalls instance) =>
    <String, dynamic>{
      'paywalls': instance.paywalls,
      'error': instance.error,
    };
