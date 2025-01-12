//
//  HabitModel.swift
//  Habit Tracking
//
//  Created by Hendawi on 11/01/2025.
//

import Foundation
import FirebaseCore

struct HabitModel {
    var id: String
    var name: String
    var isCompleted: Bool
    var datetime: Timestamp
    
    // Default initializer
    init() {
        id = ""
        name = ""
        isCompleted = false
        datetime = Timestamp()
    }
    
    // Initializer with id and document data
    init?(id: String, document: [String: Any]) {
        guard
            let name = document["name"] as? String,
            let isCompleted = document["status"] as? Bool,
            let datetime = document["datetime"] as? Timestamp
        else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
        self.datetime = datetime
    }
}
