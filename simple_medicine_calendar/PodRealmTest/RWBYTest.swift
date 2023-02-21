//
//  RWBYTest.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/11.
//

import UIKit
import RealmSwift

class Notification: Object ,ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id:UUID = UUID()
    @Persisted var body:String = ""
    @Persisted var date:Date = Date()
    
    
}
