import Flutter
import UIKit
import ApphudSDK

public class SwiftApphudPlugin: NSObject, FlutterPlugin {

    let handlers: [BaseHandler] = [
        InitializationHandler(),
        MakePurchaseHandler(),
        HandlePurchasesHandler(),
        UserPropertiesHandler(),
        RulesAndScreensMethodsHandler(),
        AttributionHandler(),
        EligibilityChecksHandler(),
        OthersHandler(),
        PaywallLogsHandler(),
        PromotionalsHandler(),
        PlacementsHandler(),
    ]

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "apphud", binaryMessenger: registrar.messenger())
        let instance = SwiftApphudPlugin()
        setHeaders()
        registrar.addMethodCallDelegate(instance, channel: channel)
        // Receive UIApplicationDelegate lifecycle callbacks (open url, continue
        // user activity, launch options) so direct deep links are captured
        // automatically without requiring native code in the host app.
        registrar.addApplicationDelegate(instance)
        let delegateChanell = FlutterMethodChannel(name: "apphud/listener", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(ApphudDelegateHandler(channel: delegateChanell), channel: delegateChanell)
        let ruleListenerChannel = FlutterMethodChannel(
            name: "apphud/rule_listener",
            binaryMessenger: registrar.messenger()
        )
        registrar.addMethodCallDelegate(
            ApphudUIDelegateHandler(channel: ruleListenerChannel),
            channel: ruleListenerChannel
        )
        let deeplinkChannel = FlutterMethodChannel(name: "apphud/deeplink", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(ApphudDeeplinkBridge(channel: deeplinkChannel), channel: deeplinkChannel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        let arguments: [String: Any]? = call.arguments as? [String: Any]
        handlers.forEach {
            $0.isAbleToHandle(method: method) ?
                $0.tryToHandle(method: method, args: arguments, result: result)
                : ()
        }
    }

    // MARK: - Deep link capture (UIApplicationDelegate lifecycle)
    //
    // Signatures must match FlutterApplicationLifeCycleDelegate (NSDictionary /
    // NSArray bridged as [AnyHashable: Any] and [Any]). Using UIKit-only
    // types like [UIApplication.LaunchOptionsKey: Any] or
    // [UIUserActivityRestoring]? means respondsToSelector: fails and Flutter
    // never invokes these methods — so direct Universal Links are silently
    // dropped.
    //
    // Universal Links return true once forwarded to Apphud so Flutter's own
    // deep-link router does not also process (and potentially bounce) them.

    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [AnyHashable: Any] = [:]
    ) -> Bool {
        Apphud.handleLaunchOptions(
            launchOptions: launchOptions as? [UIApplication.LaunchOptionsKey: Any]
        )
        return true
    }

    public func application(
        _ application: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        Apphud.handleOpen(url: url)
        // Do not consume custom-scheme opens; other plugins may also need them.
        return false
    }

    public func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([Any]) -> Void
    ) -> Bool {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              userActivity.webpageURL != nil else {
            return false
        }
        Apphud.continueUserActivity(userActivity)
        return true
    }

    private static func setHeaders() {
        ApphudHttpClient.shared.sdkType = "Flutter"
        let current = ApphudHttpClient.shared.sdkVersion
        if !current.contains("(") {
            let pluginBundle = Bundle(for: SwiftApphudPlugin.self)
            let pluginVersion =
                (pluginBundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String) ??
                (pluginBundle.object(forInfoDictionaryKey: "CFBundleVersion") as? String) ??
                "unknown"
            ApphudHttpClient.shared.sdkVersion = "\(pluginVersion)(\(current))"
        }
        
    }
}
