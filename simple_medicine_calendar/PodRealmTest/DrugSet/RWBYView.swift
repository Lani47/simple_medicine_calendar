//
//  RWBYView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/11.
//

import SwiftUI
import RealmSwift

struct RWBYView: View {
    
    @State var viewModel = RWBYViewModel()
    
    // 表示フラグ
    @State private var isColorView: Bool = false
    @State private var isDrugView: Bool = false
    @State var drugColors = Color(red: 0.852, green: 0.941, blue: 0.953)
    
    
    @State private var showingAlert = false
    @State var itemname = ""
    @FocusState  var isActive:Bool
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ScrollView {
        VStack{
            // 登録画面
            Text("登録画面")
                .font(.largeTitle)
                .padding(.bottom, 10.0)
                .onTapGesture {
                    
                }
            Text("名前")
                .font(.largeTitle)
            
            TextField("薬の名前", text: $viewModel.drugname).background(Color(red: 0.852, green: 0.941, blue: 0.953)).font(.largeTitle)
                .frame(width: widht * 0.9, height: height * 0.1)
                .focused($isActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()         // 右寄せにする
                        Button("閉じる") {
                            isActive = false  //  フォーカスを外す
                        }
                    }
                }
            Text("使用量")
                .font(.largeTitle)
            
            TextField("使用量", value:$viewModel.drugcalc, format: .number) .keyboardType(.numberPad).background(Color(red: 0.852, green: 0.941, blue: 0.953)).font(.largeTitle)
//                .frame(width: 305, height: 36)
                .frame(width: widht * 0.9, height: height * 0.1)
                .focused($isActive)
            
                
            Text("貯蓄量")
                .font(.largeTitle)
            
            TextField("貯蓄量", value: $viewModel.stockpile, format: .number) .keyboardType(.numberPad).background(Color(red: 0.852, green: 0.941, blue: 0.953)).font(.largeTitle)
                .focused($isActive)
//                .frame(width: 305, height: 36)
                .frame(width: widht * 0.9, height: height * 0.1)
                
            HStack{
                Text("色タグ")
                    .font(.largeTitle)
                
                //色の変更 別Viewに移動して変更
                Ellipse()
                    .fill($drugColors.wrappedValue)
                    .frame(width: 63, height: 61)
//                    .frame(width: widht * 0.3, height: height * 0.2)
                    .onTapGesture {
                        isColorView.toggle()
                        
                    }
                    .sheet(isPresented: $isColorView) {
                        ColorView( drugColors: $drugColors)
                    }
            }
            HStack{
                Button(action: {
                    
                    viewModel.Create(drugColorRed: drugColors.rgbValues.red, drugColorGreen: drugColors.rgbValues.green
                                     ,drugColorBlur: drugColors.rgbValues.blue)
                    itemname = viewModel.drugname
                    self.showingAlert.toggle()
                }, label: {
                    Text("登録")
                        .font(.largeTitle)
                    
                }
                )
                .alert("登録完了！",isPresented: $showingAlert){


                    
                } message:{
                    if itemname != ""{
                        Text("\(itemname)が登録されました")
                    } else {
                        Text("メイショウフメイが登録されました")
                    }
                    
                }

                //薬一覧画面を表示
                Button(action: {
                    isDrugView.toggle()
                    
                }, label: {
                    Text("登録薬一覧")
                        .font(.largeTitle)
                })
                .sheet(isPresented: $isDrugView) {
                    let realm = try! Realm()
                    
                    DrugPreviewView(drugDay: $viewModel.drugname, drugTime: $viewModel.drugname)
                        .environmentObject(DrugStore(realm: realm))
                    
                } 
            }
        }
        }
        
    }
}

struct RWBYView_Previews: PreviewProvider {
    static var previews: some View {
        RWBYView()
    }
}

