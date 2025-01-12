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
    
    func listenForHabitsUpdates(completion: @escaping ([HabitModel]) -> Void) {
        db.collection(collectionName).addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot else {
                print("Error listening for habit updates: \(String(describing: error?.localizedDescription))")
                return
            }

            let updatedHabits = snapshot.documents.compactMap { document -> HabitModel? in
                let data = document.data()
                return HabitModel(id: document.documentID, document: data)
            }

            completion(updatedHabits)
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
    
    func updateHabit(habitID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let habitDict: [String: Any] = [
            "status": true
        ]

        db.collection(collectionName).document(habitID).updateData(habitDict) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func deleteHabit(habitID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collectionName).document(habitID).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
