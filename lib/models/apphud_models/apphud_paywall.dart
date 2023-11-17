import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_paywall.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPaywall {
  final String identifier;

  // TODO: remove, not needed
  final bool isDefault;
  
  final String? experimentName;

  // TODO: remove, not needed
  final String? fromPaywall;

  final Map<String, dynamic>? json;
  final List<ApphudProduct>? products;

  ApphudPaywall({
    required this.identifier,
    required this.isDefault,
    this.experimentName,
    this.fromPaywall,
    this.json,
    this.products,
  });

  factory ApphudPaywall.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPaywallFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPaywallToJson(this);

  @override
  String toString() {
    return 'ApphudPaywall{identifier: $identifier, isDefault: $isDefault, experimentName: $experimentName, fromPaywall: $fromPaywall, json: $json, products: $products}';
  }
}
