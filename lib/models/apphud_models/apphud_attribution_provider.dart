enum ApphudAttributionProvider {
  appsFlyer,
  adjust,
  @Deprecated('Attribution for versions 14.2 or lower, iAd framework')
  appleSearchAds,
  facebook,
  firebase,
  appleAdsAttribution,
}

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
      case ApphudAttributionProvider.firebase:
        return 'firebase';
      case ApphudAttributionProvider.appleAdsAttribution:
        return 'appleAdsAttribution';
    }
  }
}
