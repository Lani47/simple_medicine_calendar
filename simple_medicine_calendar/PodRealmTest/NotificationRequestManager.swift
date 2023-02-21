//
//  NotificationRequestManager.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/11.
//

import UIKit

class NotificationRequestManager: NSObject {
    
    
    func sendsendNotificationRequest(id:UUID,str:String,dateStr:String){
        let content = UNMutableNotificationContent()
        content.title = "Remind"
        content.body = str
    
        // "yyyy-MM-dd-H-m"形式で取得した文字列を配列に変換
        let array = dateStr.split(separator: "-")
        let dateComponent = DateComponents(year: Int(array[0]),
                                           month: Int(array[1]),
                                           day: Int(array[2]),
                                           hour: Int(array[3]),
                                           minute: Int(array[4]),
                                           second: 0)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let request = UNNotificationRequest(identifier: id.uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func removeNotificationRequest(id:UUID){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [id.uuidString])
        //　通知を確認用
//        UNUserNotificationCenter.current().getPendingNotificationRequests { array in
//            print(array)
//        }
    }
}
