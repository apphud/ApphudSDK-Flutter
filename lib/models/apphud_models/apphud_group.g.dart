// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudGroup _$ApphudGroupFromJson(Map json) => ApphudGroup(
      name: json['name'] as String,
      hasAccess: json['hasAccess'] as bool,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ApphudProduct.fromJson(e as Map))
          .toList(),
    );

Map<String, dynamic> _$ApphudGroupToJson(ApphudGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'products': instance.products,
      'hasAccess': instance.hasAccess,
    };
