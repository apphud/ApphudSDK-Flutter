/// Rule metadata delivered by Apphud Rules (push or backend poll).
class ApphudRule {
  /// Rule name from Apphud Rules Dashboard.
  final String ruleName;

  /// Screen name from Apphud Screens Dashboard.
  final String screenName;

  /// Screen identifier associated with the rule.
  final String? screenId;

  /// Paywall id when the rule targets a Figma paywall.
  final String? paywallId;

  /// Custom paywall identifier when the rule targets a Figma paywall.
  ///
  /// `null` for legacy HTML rule screens.
  final String? paywallIdentifier;

  const ApphudRule({
    required this.ruleName,
    required this.screenName,
    this.screenId,
    this.paywallId,
    this.paywallIdentifier,
  });

  factory ApphudRule.fromJson(Map<dynamic, dynamic> json) {
    return ApphudRule(
      ruleName: (json['ruleName'] as String?) ?? '',
      screenName: (json['screenName'] as String?) ?? '',
      screenId: json['screenId'] as String?,
      paywallId: json['paywallId'] as String?,
      paywallIdentifier: json['paywallIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ruleName': ruleName,
      'screenName': screenName,
      'screenId': screenId,
      'paywallId': paywallId,
      'paywallIdentifier': paywallIdentifier,
    };
  }

  @override
  String toString() {
    return 'ApphudRule{ruleName: $ruleName, screenName: $screenName, screenId: $screenId, paywallId: $paywallId, paywallIdentifier: $paywallIdentifier}';
  }
}
