enum ApphudAttributionProvider { appsFlyer, adjust, appleSearchAds, facebook }

class ApphudAttributionProviderToStringConventer {
  static String convertToString(
      ApphudAttributionProvider apphudAttributionProvider) {
    switch (apphudAttributionProvider) {
      case ApphudAttributionProvider.appsFlyer:
        return "appsFlyer";
      case ApphudAttributionProvider.adjust:
        return "adjust";
      case ApphudAttributionProvider.appleSearchAds:
        return "appleSearchAds";
      case ApphudAttributionProvider.facebook:
        return "facebook";
    }
  }
}
