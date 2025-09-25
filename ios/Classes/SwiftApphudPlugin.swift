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
        let delegateChanell = FlutterMethodChannel(name: "apphud/listener", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(ApphudDelegateHandler(channel: delegateChanell), channel: delegateChanell)
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
    private static func setHeaders() {
        ApphudHttpClient.shared.sdkType = "Flutter"
        ApphudHttpClient.shared.sdkVersion = "3.0.0-beta1"
    }
}
