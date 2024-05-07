// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudGroup _$ApphudGroupFromJson(Map json) => ApphudGroup(
      name: json['name'] as String,
      hasAccess: json['hasAccess'] as bool,
      productIds: (json['productIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ApphudGroupToJson(ApphudGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'productIds': instance.productIds,
      'hasAccess': instance.hasAccess,
    };
