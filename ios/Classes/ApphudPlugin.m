#import "ApphudPlugin.h"

#if __has_include(<apphud/apphud-Swift.h>)
#import <apphud/apphud-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "apphud-Swift.h"
#endif

@implementation ApphudPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftApphudPlugin registerWithRegistrar:registrar];
}
@end
