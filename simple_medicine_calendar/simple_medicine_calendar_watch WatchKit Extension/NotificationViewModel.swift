//
//  MessageListViewModel.swift
//  simple_medicine_calendar_watch WatchKit Extension
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI
import WatchConnectivity
import UserNotifications

final class NotificationViewModel: NSObject, ObservableObject {
    
    // haptic type
    let startHaptic: WKHapticType = .start
    let stopHaptic: WKHapticType = .stop
    
  
    
    // 配列に変化があれば変更を通知
    @Published var messages: [String] = []           // [String: Any]用
    @Published var messagesData: [AnimalModel] = []  // Data型用
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
}

extension NotificationViewModel: WCSessionDelegate, UNUserNotificationCenterDelegate {
    // 追加：メッセージ受信
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // メインスレッドで処理
        
       
        /// 本編
        DispatchQueue.main.async {
            let receivedchar = message["charArray"] as? String ?? "00:00"
            let receivedtime = message["timeStr"] as? String ?? "今日"
            let receivedcount = message["drugCount"] as? String ?? "1"
            let receivedDay = message["drugDay"] as? String ?? "日曜日"
            print(receivedchar + receivedtime)  // 🐱ネコ
            // 受信したメッセージを配列に格納し配列を更新
            self.messages.append(receivedchar + "のお薬！")
            
            
            let getcount = Int(receivedcount)
            
            
            self.bom(charArray: Array(receivedchar), timeStr: receivedtime, drugCount: getcount ?? 1, drugDay: receivedDay)
        }
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("The session has completed activation.")
        }
    }
    
    // メッセージ受信 Data型
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        DispatchQueue.main.async {
            guard let message = try? JSONDecoder().decode(AnimalModel.self, from: messageData) else {
                return
            }
            self.messagesData.append(message)
        }
    }
  
    private func bom(charArray: Array<Character>, timeStr: String, drugCount: Int, drugDay: String){
        //　通知を設定した時間に毎週設定
        
        //　全ての通知を消す
        let center = UNUserNotificationCenter.current()
        //        center.removeAllPendingNotificationRequests()
        center.removePendingNotificationRequests(withIdentifiers: ["\(drugDay)\(timeStr)"])
        
        let content = UNMutableNotificationContent()
        content.title = "\(timeStr)の薬を飲みましょう！"
        content.body = "\(drugCount)種類の薬を飲む必要があります。"
        //StringからDateに変換する準備
        //        let charArray = Array(rimaindGroups22[0].kisyou)
        
        //        print(type(of: charArray))
        
        let hour1 = "\(charArray[0])"
        
        let hour = hour1 == "0" ? "\(charArray[1])": "\(charArray[0])\(charArray[1])"
        let minute1 = "\(charArray[3])"
        
        
        let minute = minute1 == "0" ?  "\(charArray[4])" : "\(charArray[3])\(charArray[4])"
        print("\(hour)時\(minute)分")
        
        
        //準備ができたので変換する
        let hourInt = Int(hour)!
        let munuteInt = Int(minute)!
        
        
        
        
        
        
        content.sound = UNNotificationSound.default
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        var dateComponentsDay = DateComponents()
        
        dateComponentsDay.hour = hourInt
        dateComponentsDay.minute = munuteInt
        //　曜日によって変える　例: 日曜日
        
        
        
        
        
        
        switch drugDay {
        case "日曜日":
            dateComponentsDay.weekday = 1
        case "月曜日":
            dateComponentsDay.weekday = 2
            
        case "火曜日":
            dateComponentsDay.weekday = 3
            
        case "水曜日":
            dateComponentsDay.weekday = 4
        case "木曜日":
            dateComponentsDay.weekday = 5
        case "金曜日":
            dateComponentsDay.weekday = 6
        case "土曜日":
            dateComponentsDay.weekday = 7
            
        default:
            dateComponentsDay.weekday = 1
        }
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsDay, repeats: true)
        
        
        //        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        let request = UNNotificationRequest(identifier: "\(drugDay)\(timeStr)", content: content, trigger: trigger)
        
        //⑤④のリクエストの通りに通知を実行させる
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        notificationCenter.add(request) { (error) in
            if error != nil {
                print(error.debugDescription)
            }
        }
        
        print("-----------------------------------------------------")
        // 登録されている通知確認
        UNUserNotificationCenter.current().getPendingNotificationRequests {
            print("Pending requests :", $0)
        }
        
    }
    
    
    
    // フォアグラウンドの状態でプッシュ通知を受信した際に呼ばれるメソッド
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list])
        print("フォアグラウンド")
    }
    
    // バックグランドの状態でプッシュ通知を受信した際に呼ばれるメソッド
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
        print("バックグラウンド")
    }
    
    func knock(type: WKHapticType?) {
        guard let _ = type else { return }
        WKInterfaceDevice.current().play(.notification)
    }
    
    
    
    
}
