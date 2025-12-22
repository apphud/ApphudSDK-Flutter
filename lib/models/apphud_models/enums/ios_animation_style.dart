/// Enum representing different animation styles for iOS paywall presentation.
enum IOSAnimationStyle {
  /// No animation - present the paywall instantly
  none,
  
  /// Bottom to top animation - standard modal presentation
  bottomToTop,
  
  /// Right to left animation - simulates push navigation style but still presented modally
  rightToLeft;

  /// Converts the enum to a string representation for platform communication
  String get stringValue {
    switch (this) {
      case IOSAnimationStyle.none:
        return 'none';
      case IOSAnimationStyle.bottomToTop:
        return 'bottomToTop';
      case IOSAnimationStyle.rightToLeft:
        return 'rightToLeft';
    }
  }

  /// Creates an IOSAnimationStyle from a string value
  static IOSAnimationStyle? fromString(String? value) {
    switch (value) {
      case 'none':
        return IOSAnimationStyle.none;
      case 'bottomToTop':
        return IOSAnimationStyle.bottomToTop;
      case 'rightToLeft':
        return IOSAnimationStyle.rightToLeft;
      default:
        return null;
    }
  }
}
