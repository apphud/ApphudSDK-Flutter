import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_placement.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPlacement {
  final String identifier;
  final ApphudPaywall? paywall;
  final String? experimentName;
  final String? variationName;

  ApphudPlacement({
    required this.identifier,
    this.paywall,
    this.experimentName,
    this.variationName,
  });

  @override
  String toString() {
    return 'ApphudPlacement{identifier: $identifier, paywall: $paywall, experimentName: $experimentName, variationName: $variationName}';
  }

  Map<String, dynamic> toJson() => _$ApphudPlacementToJson(this);

  factory ApphudPlacement.fromJson(Map<dynamic, dynamic> json) =>
      _$ApphudPlacementFromJson(json);
}
