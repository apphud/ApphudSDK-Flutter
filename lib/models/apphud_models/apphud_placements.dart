import 'package:apphud/models/apphud_models/apphud_error.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_placements.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPlacements {
  final List<ApphudPlacement> placements;
  final ApphudError? error;

  ApphudPlacements({
    required this.placements,
    this.error,
  });

  factory ApphudPlacements.fromJson(Map<dynamic, dynamic> json) =>
      _$ApphudPlacementsFromJson(json);

  Map<String, dynamic> toJson() => _$ApphudPlacementsToJson(this);
}
