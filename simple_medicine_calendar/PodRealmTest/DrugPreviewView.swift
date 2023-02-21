//
//  DrugPreviewView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2023/01/25.
//


import SwiftUI

import SwiftUI

import RealmSwift

struct DrugPreviewView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var itemorder = 0
    @State var itemname = ""
    
    @EnvironmentObject private var store: DrugStore
    
    @Binding var drugDay: String
    
    @Binding var drugTime: String
    
    @ObservedResults(DrugDB.self) var groups
    
    @State private var itemset: DrugItem?
    
    @State private var move = ""
    

    
    
    @State var title = ""

    
    @EnvironmentObject private var rimaindStore: RimaindStore
    
    @ObservedResults(RimindDrugDB.self) var rimaindGroups
    
    @State private var Rimainditemset: RimindDrugItem?
    
  
    
    @State private var showingAlerttest = false
    
    @State private var showingAlert = false
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    
    
    
    
    
    var body: some View {
        
        ScrollViewReader { reader in List {
            if groups.count != 0{
                
            
            ForEach(groups) { item in
                
                
                
                ZStack{
                    AlertView(isPresented: $showingAlerttest, title: "続きから再開しますか？", message: "", actions: [
                        (
                            title: "続きから再開する",
                            style: UIAlertAction.Style.default,
                            completionHandler: {
                                
                                print("order:\(item.order)")
                                self.showingAlerttest.toggle()
                            }
                        ),
                   
                        (
                            title: "キャンセル",
                            style: UIAlertAction.Style.cancel,
                            completionHandler: {
               
                                self.showingAlerttest.toggle()
                            }
                        ),
                    ])
                    
                    
                    
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
                                .frame(width: 150, height: 54)
                            
                        }
                        
                        
                        
                    }.onTapGesture {
           
                        itemorder = item.order
                        itemname = item.name
                        self.showingAlert.toggle()
                        
                    }
                    
                    .alert("警告",isPresented: $showingAlert){
                        Button("削除", role: .destructive){
                            // 正常に取れない
                            print("order:\(itemorder)")
                            deleteindex(index: itemorder)
                            
                        }
                        
                    } message:{
                        Text("\(itemname)が削除されますが、よろしいですか？")
                    }
                    
                }
            }
            } else {
                Text("飲む薬を薬登録画面で登録してください！").font(.largeTitle)
            }
        }}
        
        
    }
}

//struct DrugListView_Previews: PreviewProvider {
//    // プレビュー用
//    let realm = try! Realm()
//
//    static var previews: some View {
//
//        DrugListView()
//    }
//}

extension DrugPreviewView {
    
    private func create(index: Int) {
        //    store.create(title: self.title, order: items.count)
        //    self.title = ""
        
        rimaindStore.create(name: groups[index].name, drugcalc: groups[index].drugcalc, stockpile: groups[index].stockpile, drugColorRed: groups[index].drugColorRed, drugColorGreen: groups[index].drugColorGreen, drugColorBlue: groups[index].drugColorBrue, rimimdDay: drugDay, rimindTime: drugTime)
        
        //        print("name:\(groups[index].name)drugcalc:\(groups[index].drugcalc)drugDay:\(drugDay)drugTime:\(drugTime)")
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


