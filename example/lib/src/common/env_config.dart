import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static const String apphudHostKey = 'APPHUD_HOST';

  /// Loads [APPHUD_HOST] from the bundled `.env` asset (see [pubspec.yaml]).
  static Future<void> load() async {
    try {
      await dotenv.load(fileName: '.env', isOptional: true);
    } catch (_) {
      // .env missing or unreadable — use default Apphud host.
    }
    _ensureInitialized();
  }

  static void _ensureInitialized() {
    if (!dotenv.isInitialized) {
      dotenv.testLoad(fileInput: '');
    }
  }

  static String? get apphudHost {
    if (!dotenv.isInitialized) return null;
    final value = dotenv.maybeGet(apphudHostKey)?.trim();
    if (value == null || value.isEmpty) return null;
    return value;
  }
}
