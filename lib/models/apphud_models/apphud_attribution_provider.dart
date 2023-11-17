enum ApphudAttributionProvider {
  appsFlyer,
  adjust,
  // remove this, only appleAdsAttribution is needed. iAd is no longer supported by Apple
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
        // TODO: remove this, only appleAdsAttribution is needed. iAd is no longer supported by Apple
      case ApphudAttributionProvider.appleSearchAds:
        return 'appleSearchAds';
        // remove facebook
      case ApphudAttributionProvider.facebook:
        return 'facebook';
        // add firebase to Apphud.dart method description
      case ApphudAttributionProvider.firebase:
        return 'firebase';
      case ApphudAttributionProvider.appleAdsAttribution:
        return 'appleAdsAttribution';
    }
  }
}
