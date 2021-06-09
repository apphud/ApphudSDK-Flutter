import 'package:json_annotation/json_annotation.dart';
import 'package:apphud/models/apphud_models/apphud_error.dart';
import 'apphud_paywall.dart';

part 'apphud_paywalls.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPaywalls {
  final List<ApphudPaywall> paywalls;
  final ApphudError? error;

  const ApphudPaywalls({
    List<ApphudPaywall>? paywalls,
    this.error,
  }) : paywalls = paywalls ?? const <ApphudPaywall>[];

  factory ApphudPaywalls.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPaywallsFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPaywallsToJson(this);

  @override
  String toString() {
    return 'ApphudPaywalls{paywalls: $paywalls, error: $error}';
  }
}
