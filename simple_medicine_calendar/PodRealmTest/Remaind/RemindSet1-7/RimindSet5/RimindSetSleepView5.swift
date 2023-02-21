//
//  RimindSetSleepView5.swift
//  PodRealmTest
//
//  Created by cmStudent on 2023/02/02.
//

import SwiftUI
import RealmSwift
import UserNotifications
import NotificationCenter

struct RimindSetSleepView5: View {
    //　通信
    var viewModel = WatchListViewModel() // 追加
    
    @State var dateModel = DateFormatterModel()
    
    @State var cat1: Bool = false
    
    @State var cat2: Bool = false
    
    @State var cat3: Bool = false
    // DrugStore
    //
    //アラート用変数
    @State var itemorder = 0
    @State var itemname = ""
    @State private var showingAlert = false
    
    @State private var move = ""
    
    @State var drugDay = "金曜日"
    @State var drugTime = "夜"
    
    @State private var isDrugView: Bool = false
    @State private var isDatePickerView: Bool = false
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    //    // RimaindDB
    @ObservedResults(RimindDrugDB.self) var rimaindGroups
    
    @State private var rimaindItemset: RimindDrugItem?
    
    @EnvironmentObject private var rimaindStore: RimaindStore
    
    //　フィルター
    @ObservedResults(RimindDrugDB.self,where: {$0.rimindTime == "就寝前" && $0.rimindDay == "金曜日"}) var rimaindGroups1
    
    
    // RimindTestDB
    //    @ObservedResults(RimindTestDB.self) var rimindGroups
    //
    //    @State private var rimaindItemset: RimindTestItem?
    //
    //    @EnvironmentObject private var rimaindStore: RimindTestStore
    
    // DrugStoreテンプレ
    @EnvironmentObject private var store: DrugStore
    
    @ObservedResults(DrugDB.self) var groups
    
    @State private var itemset: DrugItem?
    
    // RimindTimeDB
    @ObservedResults(RimindTimeDB.self) var rimindTime
    
    @State private var rimindTimeset: RimindTimeItem?
    
    @EnvironmentObject private var rimindTimeStore: RimindTimeStore
    // MARK: 曜日を設定
    @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "金曜日"}) var rimaindGroups22
    @State var date1:Date = Date()
    
    var body: some View {
        ScrollView{
            VStack{
                //就寝前ここから
                HStack{
                    Text("就寝前")
                        .font(.largeTitle)
                    DatePicker("", selection: $date1,displayedComponents: .hourAndMinute)
                        .frame(width: widht * 0.3)
                        .font(.largeTitle)
                        .onChange(of: date1, perform: {newValue in
                            
                            let dateset = dateModel.date_string(date: date1)
                            rimindnerumeUpdate(time: dateset)
                            
                            print("$date1が操作された:\(dateset)")
                        })
                    // MARK: 初期時刻を設定
                        .onAppear(perform: {
                            date1 = dateModel.StringToDate(dateValue: rimaindGroups22[0].nerumae)
                            
                            
                        })
                }
                
                if rimaindGroups1.count != 0 {
                    ScrollViewReader { reader in List {
                        
                        
                        
                        ForEach(rimaindGroups1) { item in
                            
                            if item.rimindTime == "就寝前" && item.rimindDay == "金曜日"{
                                Text(item.name)
                                    .font(.largeTitle)
                                    .listRowBackground(Color(red: item.drugColorRed, green: item.drugColorGreen, blue: item.drugColorBrue))
                                    .onTapGesture {
                                        itemorder = item.order
                                        itemname = item.name
                                        self.showingAlert.toggle()
                                        
                                        
                                    }
                                    .alert("警告",isPresented: $showingAlert){
                                        Button("削除", role: .destructive){
                                            // 正常に取れない
//                                            print("order:\(itemorder)")
                                            deleteindex(index: itemorder)
                                        }
                                        
                                    } message:{
                                        Text("就寝前に飲む薬の\(itemname)が削除されますが、よろしいですか？")
                                    }
                                
                            }
                            
                            
                            
                        }
                        
                    }
                    }
                    .frame(height: 1 * (100 + 0.4))
                    
                }
                
                
                
                ZStack{
                    
                    Ellipse()
                        .fill(Color.blue)
                    
                        .frame(width: 50, height: 50)
                    
                    Text("+")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            self.drugTime = "就寝前"
                            self.drugDay = "金曜日"
                            print($drugTime)
                            
                            isDrugView.toggle()
                            
                        }
                        .sheet(isPresented: $isDrugView,onDismiss: {
                            let dateset = dateModel.date_string(date: date1)
                            rimindnerumeUpdate(time: dateset)
                        }) {
                            let realm = try! Realm()
                            
                            
                            
                            DrugListView(drugDay: $drugDay, drugTime: $drugTime)
                                .environmentObject(DrugStore(realm: realm))
                                .environmentObject(RimaindStore(realm: realm))
                                .environmentObject(RimindTestStore(realm: realm))
                        }
                        
                }
                
                //夜食前ここまで
                
                
                
            }
        }
        
        // MARK: - ここに飲む予定の薬を表示させたい。
        
        
    }
}



struct RimindSetSleepView5_Previews: PreviewProvider {
    static var previews: some View {
        RimindSetSleepView5()
    }
}


extension RimindSetSleepView5 {
    
    private func rimindnerumeUpdate(time: String){
        
        
        let realm = try! Realm()
        
        //        // MARK: 曜日を変更
        //        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "月曜日"}) var rimaindGroups22
        //        do{
        //            try realm.write{
        //                rimaindGroups22[0].nerumae = time
        //            }
        //        }catch {
        //            print("Error \(error)")
        //        }
        // MARK: 曜日を変更
        @ObservedResults(RimindTimeDB.self,where: {$0.rimindDay == "金曜日"}) var rimaindGroups22
        @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "金曜日"}) var rimaindGroups23
        
        do{
            try realm.write{
                
                rimaindGroups22[0].nerumae = time
                if rimaindGroups1.count != 0 {
                    rimaindGroups23[0].nerumae = "◎"
                    bom(charArray: Array(rimaindGroups22[0].nerumae),timeStr: "就寝前", drugCount: rimaindGroups1.count)
                    sendMessage(charArray: rimaindGroups22[0].nerumae, timeStr: "就寝前", drugCount: rimaindGroups1.count)
                }
                else {
                    rimaindGroups23[0].nerumae = "ー"
                }
                
            }
        }catch {
            print("Error \(error)")
        }
        
    }
    
    private func sendMessage(charArray: String, timeStr: String, drugCount: Int) {
        let messages: [String: Any] =
        ["charArray": charArray,
         "timeStr": timeStr,
         "drugCount": drugCount,
         "drugDay": drugDay]
        // 動物名と絵文字を突っ込んだ配列を送信する
        self.viewModel.session.sendMessage(messages, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
        print(messages)
    }
    
    private func bom(charArray: Array<Character>, timeStr: String, drugCount: Int){
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
        //曜日
        dateComponentsDay.weekday = 6
        
        
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
    // ケルシーに殺される
    private func mon3ter(timeStr: String){
        
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(drugDay)\(timeStr)"])
    }
    
    
    
    
    
    
    private func deleteindex(index: Int) {
        // 削除する行のIDを取得
        let deleteId = rimaindGroups[index].id
        // 削除する行の行番号を取得
        let deleteOrder = rimaindGroups[index].order
        let allcount = rimaindGroups.count
        if deleteOrder == allcount {
        } else {
            // 削除する行の行番号より大きい行番号を全て -1 する
            for i in (deleteOrder + 1)..<rimaindGroups.count {
                rimaindStore.update(id: rimaindGroups[i].id, order: rimaindGroups[i].order - 1)
            }
        }
        //        // 行を削除する
        rimaindStore.delete(id: deleteId)
        
        let realm = try! Realm()
        @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "金曜日"}) var rimaindGroups23
        
        do{
            try realm.write{
                
                // これを全てにやる
                if rimaindGroups1.count == 0 {
                    rimaindGroups23[0].nerumae = "ー"
                }
                // 薬がなくなったら通知を削除する
                if rimaindGroups1.count == 0 {
                    mon3ter(timeStr: "就寝前")
                }
                
                
                
            }
        }catch {
            print("Error \(error)")
        }
        
        //
        //        store.test()
        
        //        print("id:\(deleteId)name:\(groups[index].name)")
        //        print("index:\(index)")
    }
    
    //    private func move(sourceIndexSet: IndexSet, destination: Int) {
    //        store.move(sourceIndexSet: sourceIndexSet, destination: destination)
    //    }
}


