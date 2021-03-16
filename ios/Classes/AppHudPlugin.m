#import "AppHudPlugin.h"
#if __has_include(<appHud/appHud-Swift.h>)
#import <appHud/appHud-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "appHud-Swift.h"
#endif

@implementation AppHudPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppHudPlugin registerWithRegistrar:registrar];
}
@end
