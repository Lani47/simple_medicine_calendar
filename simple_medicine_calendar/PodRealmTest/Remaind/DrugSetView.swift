//
//  DrugSetView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/09.
//

import SwiftUI
import RealmSwift

struct DrugSetView: View {
    
    
    
    @State private var move = ""
    
    //    let realm = try Realm()
    //    @StateObject private var store = DrugStore(realm: realm)
    
    
    
    @State var title = ""
    //    var items: [DrugItem]
    // DrugStoreテンプレ
    @EnvironmentObject private var store: DrugStore
    
    @ObservedResults(DrugDB.self) var groups
    
    @State private var itemset: DrugItem?

    
    @State private var showingAlert = false
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DrugSetView_Previews: PreviewProvider {
    static var previews: some View {
        DrugSetView()
    }
}
