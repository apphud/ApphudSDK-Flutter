// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_paywall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPaywall _$ApphudPaywallFromJson(Map json) => ApphudPaywall(
      id: json['id'] as String,
      name: json['name'] as String,
      identifier: json['identifier'] as String,
      isDefault: json['isDefault'] as bool,
      experimentId: json['experimentId'] as String?,
      variationIdentifier: json['variationIdentifier'] as String?,
      json: (json['json'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e),
      ),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ApphudProduct.fromJson(e as Map))
          .toList(),
    );

Map<String, dynamic> _$ApphudPaywallToJson(ApphudPaywall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'identifier': instance.identifier,
      'isDefault': instance.isDefault,
      'experimentId': instance.experimentId,
      'variationIdentifier': instance.variationIdentifier,
      'json': instance.json,
      'products': instance.products,
    };
