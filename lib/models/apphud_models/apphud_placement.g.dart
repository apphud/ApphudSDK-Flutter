// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_placement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPlacement _$ApphudPlacementFromJson(Map json) => ApphudPlacement(
      identifier: json['identifier'] as String,
      paywall: json['paywall'] == null
          ? null
          : ApphudPaywall.fromJson(json['paywall'] as Map),
      experimentName: json['experimentName'] as String?,
    );

Map<String, dynamic> _$ApphudPlacementToJson(ApphudPlacement instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'paywall': instance.paywall,
      'experimentName': instance.experimentName,
    };
