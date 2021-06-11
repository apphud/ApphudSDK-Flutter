// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudGroup _$ApphudGroupFromJson(Map json) {
  return ApphudGroup(
    id: json['id'] as String,
    name: json['name'] as String,
    hasAccess: json['hasAccess'] as bool,
    products: (json['products'] as List<dynamic>?)
        ?.map((e) => ApphudPaywallProduct.fromJson(e as Map))
        .toList(),
  );
}

Map<String, dynamic> _$ApphudGroupToJson(ApphudGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'products': instance.products,
      'hasAccess': instance.hasAccess,
    };
