//
//  CocoaMemoryClass.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/15.
//

import SwiftUI
import RealmSwift

// テーブル
class Remaind: Object {
    @Persisted  var time = ""   // カラム
    @Persisted  var drug:DrugDB?  // カラム
}

// テーブル
class DrugDB: Object,ObjectKeyIdentifiable {
    @Persisted var id = ""
    
    @Persisted var name = ""  // カラム
    @Persisted var drugcalc = 0  // カラム
    @Persisted var stockpile = 0
    @Persisted var drugColorRed = 0.5
    @Persisted var drugColorGreen = 0.5
    @Persisted var drugColorBrue = 0.5
    @Persisted var order = 0
    
    override class func primaryKey() -> String? {
        "id"
      }
}
struct DrugItem: Identifiable {
    let id: String
    let name: String
    let drugcalc: Int
    let stockpile: Int
    var drugColorRed: Double
    var drugColorGreen: Double
    var drugColorBlue: Double
    let order: Int
}

extension DrugItem {
    init(Drug: DrugDB){
        id = Drug.id
        name = Drug.name
        drugcalc = Drug.drugcalc
        stockpile = Drug.stockpile
        drugColorRed = Drug.drugColorRed
        drugColorGreen = Drug.drugColorGreen
        drugColorBlue = Drug.drugColorBrue
        order = Drug.order
    }
}
