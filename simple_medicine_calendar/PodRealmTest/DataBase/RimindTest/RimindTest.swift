//
//  RimindTEst.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/20.
//

import Foundation
import RealmSwift

// テーブル
class RimindTestDB: Object,ObjectKeyIdentifiable {
    @Persisted var id = ""
    @Persisted var name = ""  // カラム
    @Persisted var rimaindDay = ""
    @Persisted var rimaindTime = ""
    
    override class func primaryKey() -> String? {
        "id"
    }
}

struct RimindTestItem: Identifiable {
    let id:String
    let name: String
    let rimaindDay: String
    let rimaindTime: String
}

extension RimindTestItem {
    init (RimindTest: RimindTestDB){
        id = RimindTest.id
        name = RimindTest.name
        rimaindDay = RimindTest.rimaindDay
        rimaindTime = RimindTest.rimaindTime
    }
}


