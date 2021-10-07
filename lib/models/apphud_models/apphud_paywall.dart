import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_paywall.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPaywall {
  final String id;
  final String name;
  final String identifier;
  final bool isDefault;
  final String? experimentId;
  final String? variationIdentifier;
  final Map<String, dynamic>? json;
  final List<ApphudProduct>? products;

  ApphudPaywall({
    required this.id,
    required this.name,
    required this.identifier,
    required this.isDefault,
    this.experimentId,
    this.variationIdentifier,
    this.json,
    this.products,
  });

  factory ApphudPaywall.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPaywallFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPaywallToJson(this);

  @override
  String toString() {
    return 'ApphudPaywall{id: $id, name: $name, identifier: $identifier, isDefault: $isDefault, experimentId: $experimentId, variationIdentifier: $variationIdentifier, json: $json, products: $products}';
  }
}
