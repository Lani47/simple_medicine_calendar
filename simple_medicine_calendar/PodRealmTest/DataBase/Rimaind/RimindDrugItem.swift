//
//  RimaindDrugItem.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/06.
//

import RealmSwift
import SwiftUI

// テーブル
class RimindDrugDB: Object,ObjectKeyIdentifiable {
    @Persisted var id = ""
    
    @Persisted var name = ""  // カラム
    @Persisted var drugcalc = 0  // カラム
    @Persisted var stockpile = 0
    @Persisted var drugColorRed = 0.5
    @Persisted var drugColorGreen = 0.5
    @Persisted var drugColorBrue = 0.5
    @Persisted var order = 0
    @Persisted var rimindDay = ""
    @Persisted var rimindTime = ""
    
    override class func primaryKey() -> String? {
        "id"
    }
}
struct RimindDrugItem: Identifiable {
    let id: String
    let name: String
    let drugcalc: Int
    let stockpile: Int
    var drugColorRed: Double
    var drugColorGreen: Double
    var drugColorBlue: Double
    let order: Int
    var rimindDay: String
    var rimindTime: String
}

extension RimindDrugItem {
    init(Drug: RimindDrugDB){
        id = Drug.id
        name = Drug.name
        drugcalc = Drug.drugcalc
        stockpile = Drug.stockpile
        drugColorRed = Drug.drugColorRed
        drugColorGreen = Drug.drugColorGreen
        drugColorBlue = Drug.drugColorBrue
        order = Drug.order
        rimindDay = Drug.rimindDay
        rimindTime = Drug.rimindTime
    }
}
