import UIKit
import Flutter
import ApphudSDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        registerForNotifications()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func registerForNotifications() {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (_, _) in }
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("error: \(error)")
        super.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    override  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Apphud.submitPushNotificationsToken(token: deviceToken, callback: nil)
        super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let isHandled = Apphud.handlePushNotification(apsInfo: response.notification.request.content.userInfo)
        if(!isHandled) {
            completionHandler()
            super.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
        }
    }
    
    override func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let isHandled = Apphud.handlePushNotification(apsInfo: notification.request.content.userInfo)
        if(!isHandled) {
            completionHandler([])
            super.userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
        }
    }
}
