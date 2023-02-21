//
//  MySceneDelegate.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/18.
//

import RealmSwift
import SwiftUI

//class MySceneDelegate: UIResponder, UIWindowSceneDelegate {
//    // 一部抜粋
//    // import RealmSwiftしてください。
//
//    // 一部抜粋
//    // import RealmSwiftしてください。
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//      if let windowScene = scene as? UIWindowScene {
//        do {
//          let realm = try Realm()
//          let window = UIWindow(windowScene: windowScene)
//          let contentView = ContentView()
//            .environmentObject(DrugStore(realm: realm))
//          window.rootViewController = UIHostingController(rootView: contentView)
////            self.window = window
//          window.makeKeyAndVisible()
//        } catch let error {
//          fatalError("Failed to open Realm.Error:\(error.localizedDescription)")
//        }
//      }
//    }
//
//    func sceneDidDisconnect(_ scene: UIScene) {
//    }
//}
