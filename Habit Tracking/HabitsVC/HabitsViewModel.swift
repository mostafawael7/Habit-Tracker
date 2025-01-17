//
//  HabitsViewModel.swift
//  Habit Tracking
//
//  Created by Hendawi on 11/01/2025.
//

import Foundation

class HabitsViewModel {
    let fb = FirebaseHelper.shared
    
    var habitsDidList: (([HabitModel]) -> Void)?
    var anyError: ((Error) -> Void)?
    
    var habits: [HabitModel]? {
        didSet {
            if let habits = habits {
                habitsDidList?(habits)
            }
        }
    }
    
//    func list() {
//        fb.fetchHabits {[weak self] habits, error in
//            guard let self else {return}
//            if let habits{
//                self.habits = habits
//                print("habits: \(habits)")
//            }else {
//                print(error?.localizedDescription ?? "")
//            }
//        }
//    }
    
    // Real-time updates
    func listenForUpdates() {
        fb.listenForHabitsUpdates { [weak self] updatedHabits in
            guard let self = self else { return }
            self.habits = updatedHabits // Update the local habits array
        }
    }
    
    func add(habit: String, onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void){
        fb.addHabit(name: habit) { result in
            switch result {
            case .success:
                onSuccess()
            case .failure:
                onFailure("Failed to add your new habit!")
            }
        }
    }
    
    func update(habitID: String, onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void){
        fb.updateHabit(habitID: habitID) { result in
            switch result {
            case .success:
                onSuccess()
            case .failure:
                onFailure("Failed to complete your habit!")
            }
        }
    }
    
    func delete(habitID: String, onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void){
        fb.deleteHabit(habitID: habitID) { result in
            switch result {
            case .success:
                onSuccess()
            case .failure:
                onFailure("Failed to delete your habit!")
            }
        }
    }
    
    func getHabitsCount() -> Int {
        return habits?.count ?? 0
    }
    
    func isHabitsEmpty() -> Bool {
        return habits?.isEmpty ?? true
    }
    
    func getHabit(at index: Int) -> HabitModel{
        if let habits = habits {
            return habits[index]
        }
        return HabitModel()
    }
}
