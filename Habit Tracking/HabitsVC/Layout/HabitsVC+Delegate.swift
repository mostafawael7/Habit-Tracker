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
}
