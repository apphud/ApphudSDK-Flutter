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
        PushNotificationsHandler(),
        AttributionHandler(),
        EligibilityChecksHandler(),
        OthersHandler(),
        PaywallLogsHandler()
    ]

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "apphud", binaryMessenger: registrar.messenger())
        let instance = SwiftApphudPlugin()
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
