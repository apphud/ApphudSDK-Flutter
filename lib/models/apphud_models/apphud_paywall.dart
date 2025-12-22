import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_paywall.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPaywall {
  final String identifier;
  final String? experimentName;
  final Map<String, dynamic>? json;
  final List<ApphudProduct>? products;
  final String? placementIdentifier;
  final String? variationName;
  final String? parentPaywallIdentifier;
  final bool hasScreen;

  ApphudPaywall({
    required this.identifier,
    this.experimentName,
    this.json,
    this.products,
    this.placementIdentifier,
    this.variationName,
    this.parentPaywallIdentifier,
    this.hasScreen = false,
  });

  factory ApphudPaywall.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPaywallFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPaywallToJson(this);

  @override
  String toString() {
    return 'ApphudPaywall{identifier: $identifier, experimentName: $experimentName, json: $json, products: $products, placementIdentifier: $placementIdentifier, variationName: $variationName, parentPaywallIdentifier: $parentPaywallIdentifier, hasScreen: $hasScreen}';
  }
}
