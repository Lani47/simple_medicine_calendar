//
//  appDElegate.swift
//  simple_medicine_calendar
//
//  Created by cmStudent on 2023/02/16.
//

import Foundation
import SwiftUI
import UserNotifications



class ExampleTimer {
    private var myTimer: Timer!
    
    @objc private func interval_func() {
        print("interval_func")
    }
    
    init() {
        myTimer = Timer.scheduledTimer(timeInterval:5,
                                       target:self,
                                       selector:#selector(self.interval_func),
                                       userInfo:nil,
                                       repeats:true)
    }
}
