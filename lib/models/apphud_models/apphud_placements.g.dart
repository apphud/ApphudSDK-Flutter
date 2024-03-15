// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_placements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPlacements _$ApphudPlacementsFromJson(Map json) => ApphudPlacements(
      placements: (json['placements'] as List<dynamic>)
          .map((e) => ApphudPlacement.fromJson(e as Map))
          .toList(),
      error: json['error'] == null
          ? null
          : ApphudError.fromJson(json['error'] as Map),
    );

Map<String, dynamic> _$ApphudPlacementsToJson(ApphudPlacements instance) =>
    <String, dynamic>{
      'placements': instance.placements,
      'error': instance.error,
    };
