// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_paywall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPaywall _$ApphudPaywallFromJson(Map json) => ApphudPaywall(
      identifier: json['identifier'] as String,
      experimentName: json['experimentName'] as String?,
      json: (json['json'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e),
      ),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ApphudProduct.fromJson(e as Map))
          .toList(),
      placementIdentifier: json['placementIdentifier'] as String?,
      variationName: json['variationName'] as String?,
      parentPaywallIdentifier: json['parentPaywallIdentifier'] as String?,
      hasScreen: json['hasScreen'] as bool? ?? false,
    );

Map<String, dynamic> _$ApphudPaywallToJson(ApphudPaywall instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'experimentName': instance.experimentName,
      'json': instance.json,
      'products': instance.products,
      'placementIdentifier': instance.placementIdentifier,
      'variationName': instance.variationName,
      'parentPaywallIdentifier': instance.parentPaywallIdentifier,
      'hasScreen': instance.hasScreen,
    };
