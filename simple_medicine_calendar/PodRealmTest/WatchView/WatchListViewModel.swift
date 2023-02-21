//
//  AnimalListViewModel.swift
//  simple_medicine_calendar
//
//  Created by cmStudent on 2023/02/16.
//

import WatchConnectivity

final class WatchListViewModel: NSObject {

    var session: WCSession

    init(session: WCSession  = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    
}

extension WatchListViewModel: WCSessionDelegate {
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
          
    }
    

    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("The session has completed activation.")
        }
    }
}

