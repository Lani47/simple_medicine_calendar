//
//  DBCreateTest.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/16.
//

//import Foundation
//import RealmSwift
//
//
//
//// テーブル
//class RimindTimeDB: Object,ObjectKeyIdentifiable {
//    @Persisted var id = ""
//    @Persisted var rimaindDay = ""
//    @Persisted var kisyou = "06:30"
//    @Persisted var asamae = "07:00"
//    @Persisted var asaato = "07:15"
//    @Persisted var hirumae = "12:30"
//    @Persisted var hiruato = "13:00"
//    @Persisted var oyatu = "15:00"
//    @Persisted var banmae = "19:00"
//    @Persisted var banato = "19:30"
//    @Persisted var nerumae = "21:00"
//    override class func primaryKey() -> String? {
//        "id"
//    }
//
//    /*
//     RimaindTimeDB (rimaindoDay: "月曜日",kisyou: "06:30",asamae: "07:00" etc...)
//     RimaindTimeDB (rimaindoDay: "火曜日",kisyou: "06:30",asamae: "07:00" etc...)
//     RimaindTimeDB (rimaindoDay: "水曜日",kisyou: "06:30",asamae: "07:00" etc...)
//     RimaindTimeDB (rimaindoDay: "木曜日",kisyou: "06:30",asamae: "07:00" etc...)
//     のように最初から入れておき、後からユーザーに操作してもらいたい。
//     */
//}
//struct RimindTimeItem: Identifiable {
//    var id: String
//    var rimindDay: String
//    var kisyou: String
//    var asamae: String
//    var asaato: String
//    var hirumae: String
//    var hiruato: String
//    var oyatu: String
//    var banmae: String
//    var banato: String
//    var nerumae: String
//}
//extension RimindTimeItem {
//    init (rimindTime: RimindTimeDB){
//        id = rimindTime.id
//        rimindDay = rimindTime.rimaindDay
//        kisyou = rimindTime.kisyou
//        asamae = rimindTime.asamae
//        asaato = rimindTime.asaato
//        hirumae = rimindTime.hirumae
//        hiruato = rimindTime.hiruato
//        oyatu = rimindTime.oyatu
//        banmae = rimindTime.banmae
//        banato = rimindTime.banato
//        nerumae = rimindTime.nerumae
//    }
//}
