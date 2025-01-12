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
    let db = Firestore.firestore()
    
    func fetchHabits(completion: @escaping ([HabitModel]?, Error?) -> Void) {
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
    
    func addHabit(name: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let habitDict = [
            "name": name,
            "status": false,
            "datetime": Date()
        ] as [String: Any]
        
        db.collection(collectionName).addDocument(data: habitDict) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
