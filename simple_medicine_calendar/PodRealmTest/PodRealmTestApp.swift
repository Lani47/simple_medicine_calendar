//
//  PodRealmTestApp.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/11.
//

import SwiftUI


@main
struct simple_medicine_calendar: App {
    
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) var appDelegate
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//// 追加
class MyAppDelegate: UIResponder, UIApplicationDelegate {
    @State var viewModel = TopMenuViewModel()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        // 起動時に1回だけやる処理をここに記述する
        print("起動処理")

        viewModel.requestIfNeeded()

        viewModel.bobpermission()
    



        return true
    }
}


