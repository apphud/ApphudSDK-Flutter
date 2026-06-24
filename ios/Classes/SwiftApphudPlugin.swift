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
    // These methods only observe the incoming URL/launch options for Apphud
    // attribution. The URL-handling callbacks (`open url`, `continue
    // userActivity`) return `false` so they never consume the link, allowing
    // other plugins and the host app's own deep link handling to receive the
    // event. `didFinishLaunchingWithOptions` returns `true` per the
    // UIApplicationDelegate contract; its return value is AND-combined across
    // plugins and does not consume anything.

    public func application(_ application: UIApplication,
                            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any] = [:]) -> Bool {
        Apphud.handleLaunchOptions(launchOptions: launchOptions)
        return true
    }

    public func application(_ application: UIApplication,
                            open url: URL,
                            options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        Apphud.handleOpen(url: url)
        return false
    }

    public func application(_ application: UIApplication,
                            continue userActivity: NSUserActivity,
                            restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        Apphud.continueUserActivity(userActivity)
        return false
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
