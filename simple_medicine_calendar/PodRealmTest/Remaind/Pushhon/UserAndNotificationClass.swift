//
//  UserNotificationUtil.swift
//  PodRealmTest
//
//  Created by cmStudent on 2023/01/19.
//

import UIKit
import UserNotifications

final class UserAndNotificationClass: NSObject {
    
    static var shared = UserAndNotificationClass()
    private var center = UNUserNotificationCenter.current()
    
    func initialize() {
        center.delegate = UserAndNotificationClass.shared
    }
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        
        
        UserAndNotificationClass.shared.initialize()
    }
    func showPushPermit(completion: @escaping (Result<Bool, Error>) -> Void) {
        center.requestAuthorization(options: [.alert, .badge, .sound]) { isGranted, error in
            if let error = error {
                debugPrint(error.localizedDescription)
                completion(.failure(error))
                return
            }
            completion(.success(isGranted))
        }
    }
    
    func countTimerRequest(hour: Int, minute: Int) {
        let dateComponents = DateComponents(
            calendar: Calendar.current,
            timeZone: TimeZone.current,
            hour: 19,
            minute: 30,
            weekday: 2
        )
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents,
            repeats: true
        )
        
        let content = UNMutableNotificationContent()
        content.body = "テストメッセージ"
        content.badge = 1
        content.sound = .default
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        center.add(request)
    }
    
    
}
// MARK: UNUserNotificationCenterDelegate
extension UserAndNotificationClass: UNUserNotificationCenterDelegate {
    // foregroundで通知を受信した時にはしる処理
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (_ options: UNNotificationPresentationOptions) -> Void
    ) {
        // banner: 端末上部にバナー表示
        // list: 通知センターに表示
        // sound: 通知音
        // badge: バッジ
        completionHandler([.banner, .list, .sound, .badge])
    }
    
    // 通知をタップした時にはしる処理
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        completionHandler()
    }
}
