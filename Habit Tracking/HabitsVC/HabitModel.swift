//
//  HabitModel.swift
//  Habit Tracking
//
//  Created by Hendawi on 11/01/2025.
//

import Foundation
import FirebaseCore

struct HabitModel {
    var name: String
    var status: Bool
    var datetime: Timestamp
    
    init(){
        name = ""
        status = false
        datetime = Timestamp()
    }
    
    init?(document: [String: Any]) {
        guard
            let name = document["name"] as? String,
            let status = document["status"] as? Bool,
            let datetime = document["datetime"] as? Timestamp
        else {
            return nil
        }
        
        self.name = name
        self.status = status
        self.datetime = datetime
    }
}
