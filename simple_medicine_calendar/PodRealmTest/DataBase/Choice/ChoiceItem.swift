//
//  ChoiceItem.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/07.
//

import RealmSwift


class ChoiceDB: Object,ObjectKeyIdentifiable {
    @Persisted var id = ""
    @Persisted var drug : DrugDB
}

struct ChoiceTable: Identifiable {
    let id: String
    
    var drug: DrugDB
    
}

extension ChoiceTable {
    init(Drug: ChoiceDB){
        id = Drug.id
        drug = Drug.drug
    }
}
