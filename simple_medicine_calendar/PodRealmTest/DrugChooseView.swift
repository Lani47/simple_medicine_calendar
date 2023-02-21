//
//  DrugChooseView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/07.
//

import SwiftUI
import RealmSwift

struct DrugChooseView: View {
    //sheetを破棄？
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject private var store: DrugStore
    
    @EnvironmentObject private var choiceStore: ChoiceStore
    
    @State private var move = ""

    @State var title = ""
    
    @ObservedResults(DrugDB.self) var groups
    
    @State private var itemset: DrugItem?

    
    
    @State private var showingAlerttest = false
    
    @State private var showingAlert = false
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ScrollViewReader { reader in List
            {
            ForEach(groups){ item in
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: widht * 0.80, height: height * 0.1)
                    HStack{
                        Ellipse()
                            .fill(Color(red: item.drugColorRed, green: item.drugColorGreen, blue: item.drugColorBrue))
                            .frame(width: 54, height: 54)

                            
                        
                        Text(item.name)
                            .multilineTextAlignment(.center)
                            .font(.title2)
                            .padding(.leading, 10.0)
                        Image(systemName: "trash")
                            .onTapGesture {
//                                self.showingAlert.toggle()
//                                print("alert:\(showingAlert)")
                                //正常に取れる
                                chooce(drug: item)
                                dismiss()
                            }

//                                }

                                    
                    }
                }
            }
        }
    }
    }
}

struct DrugChooseView_Previews: PreviewProvider {
    static var previews: some View {
        DrugChooseView()
    }
}

extension DrugChooseView {
    
    private func chooce(drug: DrugDB){
        choiceStore.create(choiceDrug: drug)
        
    }
    
    private func create(offsets: IndexSet) {
        //    store.create(title: self.title, order: items.count)
        //    self.title = ""
    }
    
    private func delete(offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }
        // 削除する行のIDを取得
        let deleteId = groups[index].id
        // 削除する行の行番号を取得
        let deleteOrder = groups[index].order
        let allcount = groups.count
        if deleteOrder == allcount {
        } else {
            // 削除する行の行番号より大きい行番号を全て -1 する
            for i in (deleteOrder + 1)..<groups.count {
                store.update(id: groups[i].id, order: groups[i].order - 1)
            }
        }
        //        // 行を削除する
        store.delete(id: deleteId)
        
        //
        //        store.test()
        
        //        print("id:\(deleteId)name:\(groups[index].name)")
        print("index:\(index)")
    }
    
    private func deleteindex(index: Int) {
        // 削除する行のIDを取得
        let deleteId = groups[index].id
        // 削除する行の行番号を取得
        let deleteOrder = groups[index].order
        let allcount = groups.count
        if deleteOrder == allcount {
        } else {
            // 削除する行の行番号より大きい行番号を全て -1 する
            for i in (deleteOrder + 1)..<groups.count {
                store.update(id: groups[i].id, order: groups[i].order - 1)
            }
        }
        //        // 行を削除する
        store.delete(id: deleteId)

        //
        //        store.test()

        //        print("id:\(deleteId)name:\(groups[index].name)")
//        print("index:\(index)")
    }
    
    private func move(sourceIndexSet: IndexSet, destination: Int) {
        store.move(sourceIndexSet: sourceIndexSet, destination: destination)
    }
}

