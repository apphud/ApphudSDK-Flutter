// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_paywall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPaywall _$ApphudPaywallFromJson(Map json) {
  return ApphudPaywall(
    name: json['name'] as String,
    identifier: json['identifier'] as String,
    isDefault: json['default'] as bool,
    json: (json['json'] as Map?)?.map(
      (k, e) => MapEntry(k as String, e),
    ),
    products: (json['products'] as List<dynamic>?)
        ?.map((e) => ApphudProduct.fromJson(e as Map))
        .toList(),
  );
}

Map<String, dynamic> _$ApphudPaywallToJson(ApphudPaywall instance) =>
    <String, dynamic>{
      'name': instance.name,
      'identifier': instance.identifier,
      'default': instance.isDefault,
      'json': instance.json,
      'products': instance.products,
    };
