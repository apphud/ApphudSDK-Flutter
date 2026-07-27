import UIKit
import Flutter
import UserNotifications
import ApphudSDK

@main
@objc class AppDelegate: FlutterAppDelegate {
    /// Last APNs token received; used to (re)submit after Apphud.start.
    private static var apnsToken: Data?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        let ok = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        registerForNotifications()
        // Flutter view / window may not be ready synchronously.
        DispatchQueue.main.async { [weak self] in
            self?.registerExamplePushChannel()
        }
        return ok
    }

    /// Request permission, then register for APNs on the main queue.
    private func registerForNotifications() {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            print("[ApphudExample] APNs authorization granted=\(granted) error=\(String(describing: error))")
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

    private func flutterViewController() -> FlutterViewController? {
        if let controller = window?.rootViewController as? FlutterViewController {
            return controller
        }
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if let controller = window.rootViewController as? FlutterViewController {
                    return controller
                }
            }
        }
        return nil
    }

    /// Dart calls this after `Apphud.start` so the token is submitted once the user is registered.
    private func registerExamplePushChannel() {
        guard let controller = flutterViewController() else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.registerExamplePushChannel()
            }
            return
        }

        let channel = FlutterMethodChannel(
            name: "apphud_example/push",
            binaryMessenger: controller.binaryMessenger
        )
        channel.setMethodCallHandler { call, result in
            switch call.method {
            case "resubmitApnsToken":
                if let token = Self.apnsToken {
                    Self.submitTokenToApphud(token) { success in
                        result(success)
                    }
                } else {
                    // No token yet — trigger registration; didRegister will submit.
                    print("[ApphudExample] resubmitApnsToken: no token yet, calling registerForRemoteNotifications")
                    UIApplication.shared.registerForRemoteNotifications()
                    result(false)
                }
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }

    override func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        print("[ApphudExample] didFailToRegisterForRemoteNotifications: \(error)")
        super.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }

    override func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        let hex = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("[ApphudExample] APNs device token: \(hex)")
        Self.apnsToken = deviceToken
        Self.submitTokenToApphud(deviceToken) { success in
            print("[ApphudExample] Apphud.submitPushNotificationsToken success=\(success)")
        }
        super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }

    private static func submitTokenToApphud(_ token: Data, completion: ((Bool) -> Void)? = nil) {
        Apphud.submitPushNotificationsToken(token: token) { success in
            completion?(success)
        }
    }

    override func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        Task { @MainActor in
            let isHandled = Apphud.handlePushNotification(
                apsInfo: response.notification.request.content.userInfo
            )
            if !isHandled {
                completionHandler()
                super.userNotificationCenter(
                    center,
                    didReceive: response,
                    withCompletionHandler: completionHandler
                )
            }
        }
    }

    override func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        Task { @MainActor in
            let isHandled = Apphud.handlePushNotification(
                apsInfo: notification.request.content.userInfo
            )
            if !isHandled {
                completionHandler([.banner, .sound, .badge])
                super.userNotificationCenter(
                    center,
                    willPresent: notification,
                    withCompletionHandler: completionHandler
                )
            }
        }
    }
}
