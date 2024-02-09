import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_placement.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPlacement {
  final String identifier;
  final ApphudPaywall? paywall;
  final String? experimentName;

  ApphudPlacement({
    required this.identifier,
    this.paywall,
    this.experimentName,
  });

  @override
  String toString() {
    return 'ApphudPlacement{identifier: $identifier, paywall: $paywall, experimentName: $experimentName}';
  }

  Map<String, dynamic> toJson() => _$ApphudPlacementToJson(this);

  factory ApphudPlacement.fromJson(Map<dynamic, dynamic> json) =>
      _$ApphudPlacementFromJson(json);
}
