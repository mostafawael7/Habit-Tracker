//
//  HabitsVC+Delegate.swift
//  Habit Tracking
//
//  Created by Hendawi on 11/01/2025.
//

import UIKit

extension HabitsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getHabitsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? HabitTableCell else { return UITableViewCell()}
        let habit = viewModel.getHabit(at: indexPath.row)
        cell.configureCell(habit: habit)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let habit = viewModel.getHabit(at: indexPath.row)
        if !habit.isCompleted {
            viewModel.update(habitID: habit.id, onSuccess: {
                self.displayAlert(title: "Success!", message: "You completed \(habit.name) for today!")
            }, onFailure: { error in
                self.displayAlert(title: "Error", message: error)
            })
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let habit = viewModel.getHabit(at: indexPath.row)
        if editingStyle == .delete {
            viewModel.delete(habitID: habit.id, onSuccess: {
                self.displayAlert(title: "Success!", message: "\(habit.name) is deleted from your habit list!")
            }, onFailure: { error in
                self.displayAlert(title: "Error", message: error)
            })
        }
    }
}
