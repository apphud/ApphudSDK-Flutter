import 'package:apphud/models/apphud_models/apphud_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_paywall_screen_show_result.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPaywallScreenShowResult {
  final bool success;
  final ApphudError? error;

  ApphudPaywallScreenShowResult({
    required this.success,
    this.error,
  });

  factory ApphudPaywallScreenShowResult.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPaywallScreenShowResultFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPaywallScreenShowResultToJson(this);

  @override
  String toString() {
    return 'ApphudPaywallScreenShowResult{success: $success, error: $error}';
  }
}
