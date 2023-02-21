//
//   TimeUIListView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/25.
//

import SwiftUI
import RealmSwift

struct TimeUIListView: View {
    
    let widht = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    // RimindResultDB テンプレ
    @EnvironmentObject private var RimindResultStore: RimindResultStore
    
    @ObservedResults(RimindResultDB.self) var rimaindResultGroups
    
    @State private var RimindResultset: RimindResultItem?
    
    @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "月曜日"}) var rimindResult1
    @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "火曜日"}) var rimindResult2
    @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "水曜日"}) var rimindResult3
    @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "木曜日"}) var rimindResult4
    @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "金曜日"}) var rimindResult5
    @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "土曜日"}) var rimindResult6
    @ObservedResults(RimindResultDB.self,where: {$0.rimindDay == "日曜日"}) var rimindResult7
    
    @State var drugState = "△";
    
    @State var kousinyou = 0
    //    @State var drugday = "月曜日"
    
    let realm = try! Realm()
    
    
    // 表示フラグ
    @State private var morningRimaindView1: Bool = false
    
    @State private var morningRimaindView2: Bool = false
    @State private var morningRimaindView3: Bool = false
    @State private var morningRimaindView4: Bool = false
    @State private var morningRimaindView5: Bool = false
    @State private var morningRimaindView6: Bool = false
    @State private var morningRimaindView7: Bool = false
    
    @State private var sundayRimaindView1: Bool = false
    @State private var sundayRimaindView2: Bool = false
    @State private var sundayRimaindView3: Bool = false
    @State private var sundayRimaindView4: Bool = false
    @State private var sundayRimaindView5: Bool = false
    @State private var sundayRimaindView6: Bool = false
    @State private var sundayRimaindView7: Bool = false
    
    @State private var nightRimaindView1: Bool = false
    @State private var nightRimaindView2: Bool = false
    @State private var nightRimaindView3: Bool = false
    @State private var nightRimaindView4: Bool = false
    @State private var nightRimaindView5: Bool = false
    @State private var nightRimaindView6: Bool = false
    @State private var nightRimaindView7: Bool = false
    
    @State private var sleepRimaindView1: Bool = false
    @State private var sleepRimaindView2: Bool = false
    @State private var sleepRimaindView3: Bool = false
    @State private var sleepRimaindView4: Bool = false
    @State private var sleepRimaindView5: Bool = false
    @State private var sleepRimaindView6: Bool = false
    @State private var sleepRimaindView7: Bool = false
    
    
    var isHidden = true
    
    var body: some View {
        ScrollViewReader { reader in
            VStack{
                if !isHidden {
                      Text("\(kousinyou)") // text1とtext3の間にスペースが残らない
                   }
                // MARK: - 曜日のリスト
                List {
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.99, green: 0.46, blue: 0.58))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("月曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(rimindResult1[0].kisyou)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                morningRimaindView1.toggle()
                                            }
                                       
                                            .sheet(isPresented : $morningRimaindView1 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RemaindSetMorningView().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult1[0].hirumae)
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                        //設定呼び出し
                                            .onTapGesture {
                                                sundayRimaindView1.toggle()
                                            }
                                            .sheet(isPresented: $sundayRimaindView1, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetSundayView().environmentObject(RimaindStore(realm: realm))
                                            }
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult1[0].banmae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                nightRimaindView1.toggle()
                                            }
                                            .sheet(isPresented: $nightRimaindView1, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetNightView().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult1[0].nerumae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                sleepRimaindView1.toggle()
                                            }
                                            .sheet(isPresented: $sleepRimaindView1, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                                print("\(kousinyou)")
                                            }) {
                                                RimindSetSleepView().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(0)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.997, green: 0.745, blue: 0.447))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("火曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(rimindResult2[0].kisyou)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                morningRimaindView2.toggle()
                                            }

                                            .sheet(isPresented : $morningRimaindView2 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RemaindSetMorningView2().environmentObject(RimaindStore(realm: realm))
                                            }
                                        //設定呼び出し
                                        
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult2[0].hirumae)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                sundayRimaindView2.toggle()
                                            }

                                            .sheet(isPresented : $sundayRimaindView2 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RimindSetSundayView2().environmentObject(RimaindStore(realm: realm))
                                            }
                                        
                                        //設定呼び出し
                                        
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult2[0].banmae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                nightRimaindView2.toggle()
                                            }
                                            .sheet(isPresented: $nightRimaindView2, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetNightView2().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult2[0].nerumae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                sleepRimaindView2.toggle()
                                            }
                                            .sheet(isPresented: $sleepRimaindView2, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetSleepView2().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(1)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.913, green: 0.93, blue: 0.209))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("水曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(rimindResult3[0].kisyou)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                morningRimaindView3.toggle()
                                            }

                                            .sheet(isPresented : $morningRimaindView3 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RemaindSetMorningView3().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult3[0].hirumae)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                sundayRimaindView3.toggle()
                                            }

                                            .sheet(isPresented : $sundayRimaindView3 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RimindSetSundayView3().environmentObject(RimaindStore(realm: realm))
                                            }
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult3[0].banmae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                nightRimaindView3.toggle()
                                            }
                                            .sheet(isPresented: $nightRimaindView3, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetNightView3().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        Text(rimindResult3[0].nerumae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                sleepRimaindView3.toggle()
                                            }
                                            .sheet(isPresented: $sleepRimaindView3, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetSleepView3().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(2)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.665, green: 0.879, blue: 0.631))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("木曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(rimindResult4[0].kisyou)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                morningRimaindView4.toggle()
                                            }

                                            .sheet(isPresented : $morningRimaindView4 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RemaindSetMorningView4().environmentObject(RimaindStore(realm: realm))
                                            }

                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult4[0].hirumae)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                sundayRimaindView4.toggle()
                                            }

                                            .sheet(isPresented : $sundayRimaindView4 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RimindSetSundayView4().environmentObject(RimaindStore(realm: realm))
                                            }
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult4[0].banmae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                nightRimaindView4.toggle()
                                            }
                                            .sheet(isPresented: $nightRimaindView4, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetNightView4().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult4[0].nerumae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                sleepRimaindView4.toggle()
                                            }
                                            .sheet(isPresented: $sleepRimaindView4, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetSleepView4().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(3)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.631, green: 0.851, blue: 0.879))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("金曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(rimindResult5[0].kisyou)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                morningRimaindView5.toggle()
                                            }

                                            .sheet(isPresented : $morningRimaindView5 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RemaindSetMorningView5().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult5[0].hirumae)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                sundayRimaindView5.toggle()
                                            }

                                            .sheet(isPresented : $sundayRimaindView5 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RimindSetSundayView5().environmentObject(RimaindStore(realm: realm))
                                            }
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult5[0].banmae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                nightRimaindView5.toggle()
                                            }
                                            .sheet(isPresented: $nightRimaindView5, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetNightView5().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult5[0].nerumae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                sleepRimaindView5.toggle()
                                            }
                                            .sheet(isPresented: $sleepRimaindView5, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetSleepView5().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(4)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.517, green: 0.619, blue: 0.987))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("土曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(rimindResult6[0].kisyou)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                morningRimaindView6.toggle()
                                            }

                                            .sheet(isPresented : $morningRimaindView6 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RemaindSetMorningView6().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult6[0].hirumae)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                sundayRimaindView6.toggle()
                                            }

                                            .sheet(isPresented : $sundayRimaindView6 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RimindSetSundayView6().environmentObject(RimaindStore(realm: realm))
                                            }
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                       
                                        
                                        Text(rimindResult6[0].banmae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                nightRimaindView6.toggle()
                                            }
                                            .sheet(isPresented: $nightRimaindView6, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetNightView6().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult6[0].nerumae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                sleepRimaindView6.toggle()
                                            }
                                            .sheet(isPresented: $sleepRimaindView6, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetSleepView6().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(5)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(red: 0.909, green: 0.729, blue: 0.989))
                            .frame(width:widht * 0.8, height: height
                                   * 0.3)
                        VStack{
                            Text("日曜日")
                                .font(.largeTitle)
                                .offset(y:10)
                            ZStack{
                                RoundedRectangle(cornerRadius:0)
                                    .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
                                    .frame(width:widht * 0.8, height: height
                                           * 0.21)
                                HStack{
                                    VStack{
                                        Text("朝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        
                                        Text(rimindResult7[0].kisyou)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                morningRimaindView7.toggle()
                                            }

                                            .sheet(isPresented : $morningRimaindView7 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RemaindSetMorningView7().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }
                                    .padding(.leading, 10.0)
                                    VStack{
                                        Text("昼")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult7[0].hirumae)
                                        
                                            .background(Color.white)
                                            .font(.system(size: 40,design: .rounded))
                                            .onTapGesture {
                                                sundayRimaindView7.toggle()
                                            }

                                            .sheet(isPresented : $sundayRimaindView7 , onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                //ビュー
                                                RimindSetSundayView7().environmentObject(RimaindStore(realm: realm))
                                            }
                                    } .padding(.leading, 10.0)
                                    //                                    .offset(x:-0, y: 0)
                                    VStack{
                                        Text("夜")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult7[0].banmae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                nightRimaindView7.toggle()
                                            }
                                            .sheet(isPresented: $nightRimaindView7, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetNightView7().environmentObject(RimaindStore(realm: realm))
                                            }
                                    }.padding(.leading, 10.0)
                                    //                                .offset(x:20, y: 0)
                                    
                                    VStack{
                                        Text("寝")
                                            .font(.system(size: 40,design: .rounded))
                                        
                                        Text(rimindResult7[0].nerumae)
                                            .font(.system(size: 40,design: .rounded))
                                            .background(Color.white)
                                            .onTapGesture {
                                                sleepRimaindView7.toggle()
                                            }
                                            .sheet(isPresented: $sleepRimaindView7, onDismiss : {
                                                //処理
                                                kousinyou = Int.random(in: 1..<9999)
                                            }) {
                                                RimindSetSleepView7().environmentObject(RimaindStore(realm: realm))
                                            }                                    }
                                    .padding(.horizontal, 10.0)
                                    //                                .offset(x:40, y: 0)
                                    
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }.id(6)
                    
                }
                // MARK: - 指定の曜日にワープするボタン
                HStack{
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.99, green: 0.46, blue: 0.58))
                        
//                            .frame(width: widht * 0.1, height: height * 0.06)
                            .frame(width: 40, height: 40)
                        
                        Text("月")
                            .font(.title)
                            .onTapGesture {
                                print("月曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(0)
                                }
                            }
                        
                    }
//                    .frame(width: widht * 0.1, height: height * 0.06)
                    .frame(width: 40, height: 40)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.997, green: 0.745, blue: 0.451))
                        
//                            .frame(width: widht * 0.1, height: height * 0.06)
                            .frame(width: 40, height: 40)
                        
                        Text("火")
                            .font(.title)
                            .onTapGesture {
                                print("火曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(1)
                                }
                            }
                        
                    }
//                    .frame(width: widht * 0.1, height: height * 0.06)
                    .frame(width: 40, height: 40)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.901, green: 0.918, blue: 0.206))
                        
//                            .frame(width: widht * 0.1, height: height * 0.06)
                            .frame(width: 40, height: 40)
                        
                        Text("水")
                            .font(.title)
                            .onTapGesture {
                                print("水曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(2)
                                }
                            }
                        
                    }
//                    .frame(width: widht * 0.1, height: height * 0.06)
                    .frame(width: 40, height: 40)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.665, green: 0.879, blue: 0.631))
                        
//                            .frame(width: widht * 0.1, height: height * 0.06)
                            .frame(width: 40, height: 40)
                        Text("木")
                            .font(.title)
                            .onTapGesture {
                                print("水曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(3)
                                }
                            }
                        
                    }
//                    .frame(width: widht * 0.1, height: height * 0.06)
                    .frame(width: 40, height: 40)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.631, green: 0.851, blue: 0.879))
                        
//                            .frame(width: widht * 0.1, height: height * 0.06)
                            .frame(width: 40, height: 40)
                        
                        Text("金")
                            .font(.title)
                            .onTapGesture {
                                print("金曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(4)
                                }
                            }
                        
                    }
//                    .frame(width: widht * 0.1, height: height * 0.06)
                    .frame(width: 40, height: 40)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.521, green: 0.627, blue: 0.999))
                        
//                            .frame(width: widht * 0.1, height: height * 0.06)
                            .frame(width: 40, height: 40)
                        
                        Text("土")
                            .font(.title)
                            .onTapGesture {
                                print("土曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(5)
                                }
                            }
                        
                    }
//                    .frame(width: widht * 0.1, height: height * 0.06)
                    .frame(width: 40, height: 40)
                    ZStack {
                        Ellipse()
                            .fill(Color(red: 0.916, green: 0.737, blue: 1.0))
                        
//                            .frame(width: widht * 0.1, height: height * 0.06)
                            .frame(width: 40, height: 40)
                        
                        Text("日")
                            .font(.title)
                            .onTapGesture {
                                print("日曜日")
                                withAnimation (.default) {
                                    reader.scrollTo(6)
                                }
                            }
                        
                    }
//                    .frame(width: widht * 0.1, height: height * 0.06)
                    .frame(width: 40, height: 40)
                    
                    
                }
            }
        }
        
        
        
        
        
        
        
        
        
        
    }
}

struct TimeUIListView_Previews: PreviewProvider {
    static var previews: some View {
        TimeUIListView()
    }
}


