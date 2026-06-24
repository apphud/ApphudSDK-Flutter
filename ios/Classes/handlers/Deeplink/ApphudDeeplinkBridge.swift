//
//  ApphudDeeplinkBridge.swift
//  apphud
//
//  Bridges the native deep link attribution handler to Flutter over the
//  `apphud/deeplink` method channel.
//

import Foundation
import ApphudSDK

public class ApphudDeeplinkBridge: NSObject, FlutterPlugin {

    private var channel: FlutterMethodChannel

    internal init(channel: FlutterMethodChannel) {
        self.channel = channel
    }

    public static func register(with registrar: FlutterPluginRegistrar) {}

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any]

        switch call.method {
        case "setDeeplinkHandler":
            let enabled = (args?["enabled"] as? Bool) ?? false
            setDeeplinkHandler(enabled: enabled)
            result(nil)
        case "requestDeferredDeeplinkAttribution":
            requestDeferredDeeplinkAttribution()
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func setDeeplinkHandler(enabled: Bool) {
        if enabled {
            Apphud.setDeeplinkHandler { [weak self] attribution, kind, url in
                self?.notify(attribution: attribution, kind: kind, url: url)
            }
        } else {
            Apphud.setDeeplinkHandler(nil)
        }
    }

    private func requestDeferredDeeplinkAttribution() {
        Apphud.requestDeferredDeeplinkAttribution()
    }

    private func notify(attribution: [String: Any],
                        kind: ApphudDeeplinkAttributionKind,
                        url: URL?) {
        let kindString: String
        switch kind {
        case .deferred:
            kindString = "deferred"
        default:
            kindString = "direct"
        }

        let arguments: [String: Any?] = [
            "attribution": attribution,
            "kind": kindString,
            "url": url?.absoluteString,
        ]

        channel.invokeMethod("onDeeplinkAttribution", arguments: arguments)
    }
}
