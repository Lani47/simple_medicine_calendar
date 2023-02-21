//
//  simple_medicine_calendarApp.swift
//  simple_medicine_calendar_watch WatchKit Extension
//
//  Created by cmStudent on 2023/02/16.
//

import SwiftUI

@main
struct simple_medicine_calendarApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}


