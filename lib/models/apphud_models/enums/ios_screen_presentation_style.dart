/// Enum representing iOS modal presentation styles for Apphud Rules screens.
enum IOSScreenPresentationStyle {
  /// Full screen presentation.
  fullScreen,

  /// Page sheet presentation (system default since iOS 13).
  pageSheet;

  /// Converts the enum to a string representation for platform communication.
  String get stringValue {
    switch (this) {
      case IOSScreenPresentationStyle.fullScreen:
        return 'fullScreen';
      case IOSScreenPresentationStyle.pageSheet:
        return 'pageSheet';
    }
  }
}
