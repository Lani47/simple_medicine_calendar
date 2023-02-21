//
//  RimaindStore.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/07.
//

import RealmSwift

final class RimaindStore: ObservableObject {
    
    private var itemResults: Results<RimindDrugDB>
    
    init(realm: Realm) {
        itemResults = realm.objects(RimindDrugDB.self)
            .sorted(byKeyPath: "id") // idの数値で並び替え stringが数値...?
    }
    
    var items: [RimindDrugItem] {
        itemResults.map(RimindDrugItem.init)
    }
    
}


extension RimaindStore {
    // データの追加
    func create(name: String, drugcalc: Int,stockpile:Int,drugColorRed:Double,drugColorGreen:Double,drugColorBlue:Double,rimimdDay:String,rimindTime:String) {
        objectWillChange.send()

        do {
            let realm = try Realm()

            let Drug = RimindDrugDB()
            Drug.id = UUID().uuidString
            Drug.name = name
            Drug.drugcalc = drugcalc
            Drug.stockpile = stockpile
            Drug.drugColorRed = drugColorRed
            Drug.drugColorGreen = drugColorGreen
            Drug.drugColorBrue = drugColorBlue
            Drug.rimindDay = rimimdDay
            Drug.rimindTime = rimindTime

            let drugTable = realm.objects(RimindDrugDB.self)
            Drug.order = drugTable.count

            try realm.write {
                realm.add(Drug)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    // データの削除
    func delete(id: String) {
        objectWillChange.send()
        
        guard let itemDB = itemResults.first(where: { $0.id == id }) else {
            return
        }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(itemDB)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // データの更新
    func update(id: String, order: Int) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(RimindDrugDB.self,
                             value: ["id": id,
                                     "order": order],
                             update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // Listを並び替えるための関数
    func move(sourceIndexSet: IndexSet, destination: Int) {
        guard let source = sourceIndexSet.first else {
            return
        }

        // 並び替える行のIDを取得
        let moveId = items[source].id

        // source、destinationの値については、参考資料を参考にしてください。
        // Listの行を下に移動する場合
        if source < destination {
            for i in (source + 1)...(destination - 1) {
                update(id: items[i].id, order: items[i].order - 1)
            }
            update(id: moveId, order: destination - 1)

            // Listの行を上に移動する場合
        } else if destination < source {
            // reversed()で逆から回さないと、一時的にorderの数値が重なり、想定外の挙動を示します。
            for i in (destination...(source - 1)).reversed() {
                update(id: items[i].id, order: items[i].order + 1)
            }
            update(id: moveId, order: destination)

        } else {
            return
        }
    }
    func test(){
        print("sucsess!!!!!!")
    }
}

