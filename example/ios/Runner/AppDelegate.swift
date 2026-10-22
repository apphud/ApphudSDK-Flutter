import UIKit
import Flutter
import UserNotifications
import ApphudSDK

@main
@objc class AppDelegate: FlutterAppDelegate {
    /// Last APNs token received; used to (re)submit after Apphud.start.
    private static var apnsToken: Data?

    // A single explicit engine keeps plugin registration before didFinishLaunching,
    // including on Flutter versions predating FlutterImplicitEngineDelegate.
    lazy var exampleFlutterEngine = FlutterEngine(name: "apphud-example")

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        guard exampleFlutterEngine.run() else { return false }
        GeneratedPluginRegistrant.register(with: exampleFlutterEngine)
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


// UIKit requires a scene-based window on iOS 27 when linking the current SDK.
// Keep the existing FlutterAppDelegate responsible for push and plugin callbacks.
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene,
              let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let controller = FlutterViewController(engine: appDelegate.exampleFlutterEngine,
                                               nibName: nil, bundle: nil)
        let sceneWindow = UIWindow(windowScene: windowScene)
        sceneWindow.rootViewController = controller
        window = sceneWindow
        appDelegate.window = sceneWindow
        sceneWindow.makeKeyAndVisible()
        self.scene(scene, openURLContexts: connectionOptions.urlContexts)
        for activity in connectionOptions.userActivities {
            self.scene(scene, continue: activity)
        }
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        UIApplication.shared.delegate?.applicationDidBecomeActive?(UIApplication.shared)
    }
    func sceneWillResignActive(_ scene: UIScene) {
        UIApplication.shared.delegate?.applicationWillResignActive?(UIApplication.shared)
    }
    func sceneWillEnterForeground(_ scene: UIScene) {
        UIApplication.shared.delegate?.applicationWillEnterForeground?(UIApplication.shared)
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
        UIApplication.shared.delegate?.applicationDidEnterBackground?(UIApplication.shared)
    }
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        _ = UIApplication.shared.delegate?.application?(UIApplication.shared,
            continue: userActivity, restorationHandler: { _ in })
    }
    func scene(_ scene: UIScene, openURLContexts contexts: Set<UIOpenURLContext>) {
        for context in contexts {
            var options: [UIApplication.OpenURLOptionsKey: Any] = [.openInPlace: context.options.openInPlace]
            if let source = context.options.sourceApplication { options[.sourceApplication] = source }
            if let annotation = context.options.annotation { options[.annotation] = annotation }
            _ = UIApplication.shared.delegate?.application?(UIApplication.shared,
                open: context.url, options: options)
        }
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
           appDelegate.window === window { appDelegate.window = nil }
        window = nil
    }
}
