import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // The method channel delivers Map<dynamic, dynamic>, so tests feed fromJson
  // exactly what the native toMap() implementations emit.
  group('ApphudPaywall.fromJson', () {
    test('parses screenName when present', () {
      final paywall = ApphudPaywall.fromJson(<dynamic, dynamic>{
        'identifier': 'main',
        'hasScreen': true,
        'screenName': 'Onboarding paywall',
      });

      expect(paywall.screenName, 'Onboarding paywall');
    });

    test('screenName is null when key is absent', () {
      final paywall = ApphudPaywall.fromJson(<dynamic, dynamic>{
        'identifier': 'main',
        'hasScreen': false,
      });

      expect(paywall.screenName, isNull);
    });

    test('screenName is null when native side sends explicit null', () {
      final paywall = ApphudPaywall.fromJson(<dynamic, dynamic>{
        'identifier': 'main',
        'hasScreen': true,
        'screenName': null,
      });

      expect(paywall.screenName, isNull);
    });

    test('screenName survives toJson round-trip', () {
      final paywall = ApphudPaywall.fromJson(<dynamic, dynamic>{
        'identifier': 'main',
        'screenName': 'Onboarding paywall',
      });

      final restored = ApphudPaywall.fromJson(paywall.toJson());

      expect(restored.screenName, 'Onboarding paywall');
    });
  });
}
