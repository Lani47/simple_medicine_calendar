//
//  RWBYViewModel.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/21.
//

import Foundation
import SwiftUI
import RealmSwift

class RWBYViewModel: ObservableObject {
    @Published var drugname = ""
    @Published var drugcalc = 1
    @Published var stockpile = 1

    @Published var drugColors = Color(red: 0.852, green: 0.941, blue: 0.953)
    

    
    
    
    
    func Create(drugColorRed:Double,drugColorGreen:Double,drugColorBlur:Double){
        //データの登録
        let drug = DrugDB()
        drug.id = UUID().uuidString
        if drugname == ""{
            drug.name = "メイショウフメイ"
        } else {
            drug.name = drugname
        }
        drug.drugcalc = drugcalc
        drug.stockpile = stockpile
        drug.drugColorRed = drugColorRed
        drug.drugColorGreen =
        drugColorGreen
        drug.drugColorBrue = drugColorBlur
        
        
        
        // 保存
        let realm = try! Realm()
        
        //の前に並び替えのためのデータの要素数を数える
        let drugTable = realm.objects(DrugDB.self)
        drug.order = drugTable.count
        //今度こそ保存？
        try! realm.write {
            realm.add(drug)
        }
        print("\(drugname)を登録しました。")
    }
    func load(){
        let realm = try! Realm()
        let drugTable = realm.objects(DrugDB.self)
        
        if drugTable.count != 0{
            let drugTable = realm.objects(DrugDB.self)
                print(drugTable[0])
        drugname = drugTable[0].name
            drugcalc = drugTable[0].drugcalc
            stockpile = drugTable[0].stockpile
//            drugColors = Color(red:drugTable[0].drugColorRed, green: drugTable[0].drugColorGreen, blue: drugTable[0].drugColorBrue)
            
           
        } else {
            print("登録なし")
        }
     
    }
    func loadColor() -> Color{
        let realm = try! Realm()
        let drugTable = realm.objects(DrugDB.self)
        
        if drugTable.count != 0{
            let drugTable = realm.objects(DrugDB.self)
                print(drugTable[0])
        drugname = drugTable[0].name
            drugcalc = drugTable[0].drugcalc
            stockpile = drugTable[0].stockpile
//            drugColors = Color(red:drugTable[0].drugColorRed, green: drugTable[0].drugColorGreen, blue: drugTable[0].drugColorBrue)
            
            return Color(red:drugTable[0].drugColorRed, green: drugTable[0].drugColorGreen, blue: drugTable[0].drugColorBrue)
        } else {
            print("登録なし")
        }
        return Color(red: 0.852, green: 0.941, blue: 0.953)

        
    }
}

