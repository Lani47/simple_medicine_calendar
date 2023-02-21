//
//  WatchView.swift
//  simple_medicine_calendar
//
//  Created by cmStudent on 2023/02/16.
//

import SwiftUI
import WatchConnectivity
//スマホ
struct WatchView: View {
    
    let animals = ["薬を飲む時間です！", "イヌ", "ハムスター", "ドラゴン", "ユニコーン"]
    let emojiAnimals = ["🐱", "🐶", "🐹", "🐲", "🦄"]
    
    var viewModel = WatchListViewModel() // 追加
    
    @ObservedObject private var connector = WatchConnector()
    
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(
            red: 30/255,
            green: 150/255,
            blue: 234/255,
            alpha: 1.0
        )
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font : UIFont.systemFont(ofSize: 30, weight: .bold)
        ]
        navigationBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font : UIFont.systemFont(ofSize: 30, weight: .bold)
        ]
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
    
    var body: some View {
        // テスト
//                    VStack {
                       
//                        VStack{
//                            Text("You have pushed the button this many times:")
//                            Text(String(self.connector.count))
//                                .font(.largeTitle)
//                                .foregroundColor(Color.gray)
//
//                            Text("\(self.connector.receivedMessage)")
//                        }
//                        .frame(maxHeight: .infinity)
//
//                        HStack{
//                            Spacer()
//
//                            Button(action: {
//                                self.connector.send()
//                            }, label: {
//                                Image(systemName: "plus")
//                                    .frame(width: 50, height: 50)
//                            })
//                            .padding()
//                            .accentColor(Color.white)
//                            .background(Color(red: 30/255, green: 150/255, blue: 234/255))
//                            .font(.system(size: 30))
//                            .cornerRadius(50)
//                        }
//                        .padding()
//                    }
//                    .frame(maxHeight: .infinity)
//                    .navigationTitle("Sample App")
        
        
        // 本編
//
//        List(0 ..< animals.count) { index in
//            Button {
//                // タップ時の処理
//                self.sendMessage(index: index)  // 追加
//            } label: {
//                HStack {
//                    Text(self.emojiAnimals[index])
//                        .font(.title)
//                        .padding()
//                    Text(self.animals[index])
//                }
//            }
//        }
//        //                .listStyle(CarouselListStyle())
//        .navigationBarTitle(Text("Animal List"))
        
        Text("podenko")
        
        
    }
    private func sendMessage(index: Int) {
            let messages: [String: Any] =
                ["animal": animals[index],
                 "emoji": emojiAnimals[index]]
            // 動物名と絵文字を突っ込んだ配列を送信する
            self.viewModel.session.sendMessage(messages, replyHandler: nil) { (error) in
                print(error.localizedDescription)
            }
        print(messages)
        }
}

struct WatchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class WatchConnector: NSObject, ObservableObject, WCSessionDelegate {
    
    @Published var receivedMessage = "WATCH: 未受信"
    @Published var count = 0
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
        print("activationDidCompleteWith state= \(activationState.rawValue)")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        print("didReceiveMessage: \(message)")
        
        DispatchQueue.main.async {
            self.receivedMessage = "WATCH : \(message["WATCH_COUNT"] as! Int)"
            self.count = message["WATCH_COUNT"] as! Int
        }
    }
    
    func send() {
        if WCSession.default.isReachable {
            count += 1
            WCSession.default.sendMessage(["PHONE_COUNT" : count], replyHandler: nil)
        }
    }
}

