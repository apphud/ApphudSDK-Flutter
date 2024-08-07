enum ApphudAttributionProvider {
  appsFlyer,
  adjust,
  firebase,
  appleAdsAttribution,
  custom,
}

extension ApphudAttributionProviderConverter on ApphudAttributionProvider {
  String get convertToString {
    switch (this) {
      case ApphudAttributionProvider.appsFlyer:
        return 'appsFlyer';
      case ApphudAttributionProvider.adjust:
        return 'adjust';
      case ApphudAttributionProvider.firebase:
        return 'firebase';
      case ApphudAttributionProvider.appleAdsAttribution:
        return 'appleAdsAttribution';
      case ApphudAttributionProvider.custom:
        return 'custom';
    }
  }
}
