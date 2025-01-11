//
//  Firebase Helper.swift
//  Habit Tracking
//
//  Created by Hendawi on 11/01/2025.
//

import FirebaseFirestore

class FirebaseHelper {
    static let shared = FirebaseHelper()
    
    private let collectionName = "Habits"
    
    func fetchHabits(completion: @escaping ([HabitModel]?, Error?) -> Void) {
        let db = Firestore.firestore()
        db.collection(collectionName).getDocuments { snapshot, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let documents = snapshot?.documents else {
                completion(nil, nil)
                return
            }
            
            let files = documents.compactMap { document -> HabitModel? in
                return HabitModel(document: document.data())
            }
            
            completion(files, nil)
        }
    }
}
