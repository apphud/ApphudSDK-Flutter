// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_paywall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPaywall _$ApphudPaywallFromJson(Map json) => ApphudPaywall(
      identifier: json['identifier'] as String,
      isDefault: json['isDefault'] as bool,
      experimentName: json['experimentName'] as String?,
      variationName: json['variationName'] as String?,
      fromPaywall: json['fromPaywall'] as String?,
      json: (json['json'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e),
      ),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ApphudProduct.fromJson(e as Map))
          .toList(),
    );

Map<String, dynamic> _$ApphudPaywallToJson(ApphudPaywall instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'isDefault': instance.isDefault,
      'experimentName': instance.experimentName,
      'variationName': instance.variationName,
      'fromPaywall': instance.fromPaywall,
      'json': instance.json,
      'products': instance.products,
    };
