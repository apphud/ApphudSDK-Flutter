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

    /// Keeps the last bridge that enabled a Flutter deeplink handler so we can
    /// re-apply it after `Apphud.start` / `startManually`, which reset the
    /// native handler to `nil` when no `deeplinkHandler` argument is passed.
    private static weak var activeBridge: ApphudDeeplinkBridge?
    private static var handlerEnabled = false

    private var channel: FlutterMethodChannel

    internal init(channel: FlutterMethodChannel) {
        self.channel = channel
    }

    public static func register(with registrar: FlutterPluginRegistrar) {}

    /// Re-installs the Flutter deeplink handler if Dart previously enabled it.
    /// Call after `Apphud.start` / `startManually` (those APIs clear the handler).
    @MainActor
    static func reapplyHandlerIfNeeded() {
        guard handlerEnabled, let bridge = activeBridge else { return }
        bridge.installHandler()
    }

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
        Self.handlerEnabled = enabled
        if enabled {
            Self.activeBridge = self
            Task { @MainActor in
                self.installHandler()
            }
        } else {
            if Self.activeBridge === self {
                Self.activeBridge = nil
            }
            Task { @MainActor in
                Apphud.setDeeplinkHandler(nil)
            }
        }
    }

    @MainActor
    private func installHandler() {
        Apphud.setDeeplinkHandler { [weak self] attribution, kind, url in
            self?.notify(attribution: attribution, kind: kind, url: url)
        }
    }

    private func requestDeferredDeeplinkAttribution() {
        Task { @MainActor in
            Apphud.requestDeferredDeeplinkAttribution()
        }
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

        // Apphud may invoke the deep link handler from a background thread
        // (especially for deferred attribution). Flutter platform channels must
        // be called from the main thread.
        if Thread.isMainThread {
            channel.invokeMethod("onDeeplinkAttribution", arguments: arguments)
        } else {
            DispatchQueue.main.async { [channel] in
                channel.invokeMethod("onDeeplinkAttribution", arguments: arguments)
            }
        }
    }
}
