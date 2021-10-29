import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_paywall.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPaywall {
  final String identifier;
  final bool isDefault;
  final String? experimentName;
  final String? variationName;
  final String? fromPaywall;
  final Map<String, dynamic>? json;
  final List<ApphudProduct>? products;

  ApphudPaywall({
    required this.identifier,
    required this.isDefault,
    this.experimentName,
    this.variationName,
    this.fromPaywall,
    this.json,
    this.products,
  });

  factory ApphudPaywall.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPaywallFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPaywallToJson(this);

  @override
  String toString() {
    return 'ApphudPaywall{identifier: $identifier, isDefault: $isDefault, experimentName: $experimentName, variationName: $variationName, fromPaywall: $fromPaywall, json: $json, products: $products}';
  }
}
