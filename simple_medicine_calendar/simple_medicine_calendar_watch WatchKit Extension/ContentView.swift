//
//  ContentView.swift
//  simple_medicine_calendar_watch WatchKit Extension
//
//  Created by cmStudent on 2023/02/16.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    
    @ObservedObject var connector = PhoneConnector()
    
    @ObservedObject var viewModel = NotificationViewModel()  // 追加
    
    @State var index = 0

    
    var body: some View {
        VStack {

            
       
            Button(action: {
//                print(self.viewModel.messages)
                self.viewModel.messages = []
            }, label: { Text("メッセージ削除") })
            List {
                                ForEach(self.viewModel.messages, id: \.self) { message in
                                    MessageRow(message: message)
                                }
                                .onDelete(perform: rowRemove(offsets:))



                            }
        }
    }
    

        func rowRemove(offsets: IndexSet) {
            print("さ")
            self.viewModel.messages.remove(atOffsets: offsets)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class PhoneConnector: NSObject, ObservableObject, WCSessionDelegate {
    @Published var receivedMessage = "PHONE : 未受信"
    @Published var count = 0
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith state= \(activationState.rawValue)")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("didReceiveMessage: \(message)")
                
        DispatchQueue.main.async {
            self.receivedMessage = "PHONE : \(message["PHONE_COUNT"] as! Int)"
            self.count = message["PHONE_COUNT"] as! Int
        }
    }
    //送る？
    func send() {
        if WCSession.default.isReachable {
            count += 1
            WCSession.default.sendMessage(["WATCH_COUNT": count], replyHandler: nil) {
                error in
                print(error)
                print("\(self.count)")
            }
        }
    }
}

