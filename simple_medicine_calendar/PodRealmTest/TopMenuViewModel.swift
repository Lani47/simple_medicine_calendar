//
//  TopMenuViewModel.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/20.
//

import SwiftUI
import RealmSwift

class TopMenuViewModel: ObservableObject{
    
    @EnvironmentObject private var rimaindStore: RimindTimeStore
    
    @ObservedResults(RimindTimeDB.self) var rimaindGroups
    
    @State private var RimaindTimeset: RimindTimeItem?
    
    @AppStorage("launchedCount") var launchedCount = 0
    
    // RimindResultStore テンプレ
    @EnvironmentObject private var RimindResultStore: RimindResultStore
    
    @ObservedResults(RimindResultDB.self) var rimaindResultGroups
    
    @State private var RimindResultset: RimindResultItem?
    
//    RimindResult
    
    /// 初回起動なら発動
    func requestIfNeeded() {
        
        launchedCount += 1
        print("起動回数:\(launchedCount)")
        if launchedCount == 1 {
            print("初回処理発動")
            newSet()
        }
    }
    
    
    //    func setup() {
    //        //UserDefaults.standard.set(false, forKey: "visit") //リセット用
    //        let visit = UserDefaults.standard.bool(forKey: "visit")
    //        if visit {
    //            //二回目以降
    //            print("二回目以降")
    //        } else {
    //            //初回アクセス
    //            print("初回起動")
    //            UserDefaults.standard.set(true, forKey: "visit")
    //        }
    //    }
    
    
    func newSet() {
        create(rimindDay: "月曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "火曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "水曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "木曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "金曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "土曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        create(rimindDay: "日曜日", kisyou: "06:30", asamae: "07:00", asaato: "07:15", hirumae: "12:30", hiruato: "13:00", oyatu: "15:00", banmae: "19:00", banato: "19:30", nerumae: "21:00")
        
        rimindResultcreate(rimindDay: "月曜日", kisyou: "ー", asamae: "ー", asaato: "ー", hirumae: "ー", hiruato: "ー", oyatu: "ー", banmae: "ー", banato: "ー", nerumae: "ー")
        rimindResultcreate(rimindDay: "火曜日", kisyou: "ー", asamae: "ー", asaato: "ー", hirumae: "ー", hiruato: "ー", oyatu: "ー", banmae: "ー", banato: "ー", nerumae: "ー")
        rimindResultcreate(rimindDay: "水曜日", kisyou: "ー", asamae: "ー", asaato: "ー", hirumae: "ー", hiruato: "ー", oyatu: "ー", banmae: "ー", banato: "ー", nerumae: "ー")
        rimindResultcreate(rimindDay: "木曜日", kisyou: "ー", asamae: "ー", asaato: "ー", hirumae: "ー", hiruato: "ー", oyatu: "ー", banmae: "ー", banato: "ー", nerumae: "ー")
        rimindResultcreate(rimindDay: "金曜日", kisyou: "ー", asamae: "ー", asaato: "ー", hirumae: "ー", hiruato: "ー", oyatu: "ー", banmae: "ー", banato: "ー", nerumae: "ー")
        rimindResultcreate(rimindDay: "土曜日", kisyou: "ー", asamae: "ー", asaato: "ー", hirumae: "ー", hiruato: "ー", oyatu: "ー", banmae: "ー", banato: "ー", nerumae: "ー")
        rimindResultcreate(rimindDay: "日曜日", kisyou: "ー", asamae: "ー", asaato: "ー", hirumae: "ー", hiruato: "ー", oyatu: "ー", banmae: "ー", banato: "ー", nerumae: "ー")
        print("初期データセット完了")
        
        
    }
    
    func bobpermission(){
        //通知許諾ウィンドウ表示(初回だけ)
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound]){
                (granted, _) in
                if granted {
                    //通知が許可されているときの処理
                    print("許可")
                }else {
                    //通知が拒否されているときの処理
                    print("拒否")
                    
                }
            }
    }
    
    func create(rimindDay: String, kisyou:String, asamae:String, asaato: String, hirumae: String, hiruato:String, oyatu:String,banmae:String,banato:String,nerumae:String) {
        
        objectWillChange.send()
//
        do {
            let realm = try Realm()

            let rimind = RimindTimeDB()
            rimind.id = UUID().uuidString
            rimind.rimindDay = rimindDay
            rimind.kisyou = kisyou
            rimind.asamae = asamae
            rimind.asaato = asaato
            rimind.hirumae = hirumae
            rimind.hiruato = hiruato
            rimind.oyatu = oyatu
            rimind.banmae = banmae
            rimind.banato = banato
            rimind.nerumae = nerumae
            
            try realm.write {
                realm.add(rimind)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func rimindResultcreate(rimindDay: String, kisyou:String, asamae:String, asaato: String, hirumae: String, hiruato:String, oyatu:String,banmae:String,banato:String,nerumae:String){
        
        objectWillChange.send()
//
        do {
            let realm = try Realm()

            let rimind = RimindResultDB()
            rimind.id = UUID().uuidString
            rimind.rimindDay = rimindDay
            rimind.kisyou = kisyou
            rimind.asamae = asamae
            rimind.asaato = asaato
            rimind.hirumae = hirumae
            rimind.hiruato = hiruato
            rimind.oyatu = oyatu
            rimind.banmae = banmae
            rimind.banato = banato
            rimind.nerumae = nerumae
            
            try realm.write {
                realm.add(rimind)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        print("test")
    }
    
}
