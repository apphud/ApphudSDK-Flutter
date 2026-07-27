/// Indicates how a deep link attribution result was obtained.
///
/// - [direct]: the user opened an actual deep link (App Link / Universal Link
///   or custom scheme URL).
/// - [deferred]: attribution was resolved for the current installation without
///   an explicit link, typically right after install.
enum ApphudDeeplinkAttributionKind {
  direct,
  deferred,
}

/// Deep link attribution result delivered to an [ApphudDeeplinkHandler].
///
/// The handler may be invoked multiple times during the app lifecycle for both
/// direct and deferred flows. When no attribution match is found, [attribution]
/// is an empty map.
class ApphudDeeplinkAttribution {
  /// The attribution data returned by Apphud. Empty when no match is found.
  final Map<String, dynamic> attribution;

  /// Whether the attribution came from a direct link open or a deferred lookup.
  final ApphudDeeplinkAttributionKind kind;

  /// The original deep link URL for direct opens, or `null` for deferred
  /// attribution.
  final String? url;

  ApphudDeeplinkAttribution({
    required this.attribution,
    required this.kind,
    this.url,
  });

  factory ApphudDeeplinkAttribution.fromMap(Map<dynamic, dynamic> map) {
    final rawAttribution = map['attribution'];
    final attribution = rawAttribution is Map
        ? rawAttribution.map((key, value) => MapEntry(key.toString(), value))
        : <String, dynamic>{};

    return ApphudDeeplinkAttribution(
      attribution: attribution,
      kind: (map['kind']?.toString() == 'deferred')
          ? ApphudDeeplinkAttributionKind.deferred
          : ApphudDeeplinkAttributionKind.direct,
      url: map['url'] as String?,
    );
  }
}

/// Callback that receives deep link attribution updates.
///
/// It may be invoked multiple times during the app lifecycle for both direct
/// and deferred flows.
typedef ApphudDeeplinkHandler = void Function(
  ApphudDeeplinkAttribution attribution,
);
