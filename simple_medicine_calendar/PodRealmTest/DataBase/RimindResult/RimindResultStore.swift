//
//  RimindResultStore.swift
//  PodRealmTest
//
//  Created by cmStudent on 2023/01/20.
//

import Foundation

import RealmSwift

final class RimindResultStore: ObservableObject {
    
    private var itemResults: Results<RimindResultDB>
    
    init(realm: Realm) {
        itemResults = realm.objects(RimindResultDB.self)
            .sorted(byKeyPath: "id") // idの数値で並び替え stringが数値...?
    }
    
    var items: [RimindResultItem] {
        itemResults.map(RimindResultItem.init)
    }
    
}


extension RimindResultStore {
    // データの追加
    func create(rimindDay: String, kisyou:String, asamae:String, asaato: String, hirumae: String, hiruato:String, oyatu:String,banmae:String,banato:String,nerumae:String) {
        
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
    
    // 旧データの更新
    func update(id: String, kisyou: String) {
        objectWillChange.send()

        do {
            let realm = try Realm()
            try realm.write {
                realm.create(RimindResultDB.self,
                             value: ["id": id,
                                     "kisyou": kisyou],
                             update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
//    // Listを並び替えるための関数
//    func move(sourceIndexSet: IndexSet, destination: Int) {
//        guard let source = sourceIndexSet.first else {
//            return
//        }
//
//        // 並び替える行のIDを取得
//        let moveId = items[source].id
//
//        // source、destinationの値については、参考資料を参考にしてください。
//        // Listの行を下に移動する場合
//        if source < destination {
//            for i in (source + 1)...(destination - 1) {
//                update(id: items[i].id, order: items[i].order - 1)
//            }
//            update(id: moveId, order: destination - 1)
//
//            // Listの行を上に移動する場合
//        } else if destination < source {
//            // reversed()で逆から回さないと、一時的にorderの数値が重なり、想定外の挙動を示します。
//            for i in (destination...(source - 1)).reversed() {
//                update(id: items[i].id, order: items[i].order + 1)
//            }
//            update(id: moveId, order: destination)
//
//        } else {
//            return
//        }
//    }
    func test(){
        print("sucsess!!!!!!")
    }
}


