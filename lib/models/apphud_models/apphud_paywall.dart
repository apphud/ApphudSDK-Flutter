import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_paywall.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPaywall {
  final String name;
  final String identifier;
  @JsonKey(name: 'default')
  final bool isDefault;
  final Map<String, dynamic>? json;
  final List<ApphudProduct>? products;

  ApphudPaywall({
    required this.name,
    required this.identifier,
    required this.isDefault,
    this.json,
    this.products,
  });

  factory ApphudPaywall.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPaywallFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPaywallToJson(this);

  @override
  String toString() {
    return 'ApphudPaywall{name: $name, identifier: $identifier, isDefault: $isDefault, json: $json, products: $products}';
  }
}
