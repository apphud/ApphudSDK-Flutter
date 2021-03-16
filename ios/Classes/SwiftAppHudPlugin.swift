import Flutter
import UIKit
import ApphudSDK

public class SwiftAppHudPlugin: NSObject, FlutterPlugin {

    static let apphudDelegate = PluginApphudDelegate();

    let handlers: [BaseHandler] = [
        InitializationHandler(),
        MakePurchaseHandler(),
        HandlePurchasesHandler(),
        UserPropertiesHandler(),
        RulesAndScreensMethodsHandler(),
        PushNotificationsHandler(),
        AttributionHandler(),
        EligibilityChecksHandler(),
        OthersHandler(),
    ]

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "appHud", binaryMessenger: registrar.messenger())
        let instance = SwiftAppHudPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
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
}
