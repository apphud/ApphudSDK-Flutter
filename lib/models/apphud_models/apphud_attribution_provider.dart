enum ApphudAttributionProvider { appsFlyer, adjust, appleSearchAds, facebook }

extension ApphudAttributionProviderConverter on ApphudAttributionProvider {
  String get convertToString {
    switch (this) {
      case ApphudAttributionProvider.appsFlyer:
        return 'appsFlyer';
      case ApphudAttributionProvider.adjust:
        return 'adjust';
      case ApphudAttributionProvider.appleSearchAds:
        return 'appleSearchAds';
      case ApphudAttributionProvider.facebook:
        return 'facebook';
    }
  }
}
