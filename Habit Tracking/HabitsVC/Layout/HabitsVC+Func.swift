//
//  HabitsVC+Func.swift
//  Habit Tracking
//
//  Created by Hendawi on 11/01/2025.
//

import UIKit

extension HabitsVC {
    func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    func bindViewModel(){
        viewModel.habitsDidList = { [weak self] habits in
            guard let self = self else { return }
            if viewModel.isHabitsEmpty() {
                noDataImg.isHidden = false
                tableView.isHidden = true
            }else{
                noDataImg.isHidden = true
                tableView.isHidden = false
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            hideAnimatedActivityIndicatorView()
        }
        
        viewModel.anyError = { [weak self] error in
            guard let self = self else { return }
            hideAnimatedActivityIndicatorView()
            displayAlert(title: "Error", message: error.localizedDescription, handler: nil)
        }
    }
}
