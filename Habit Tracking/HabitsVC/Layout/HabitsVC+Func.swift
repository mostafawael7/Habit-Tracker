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
        
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: AnyObject) {
        viewModel.list()
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
                tableView.reloadData()
            }
            hideAnimatedActivityIndicatorView()
            refreshControl.endRefreshing()
        }
        
        viewModel.anyError = { [weak self] error in
            guard let self = self else { return }
            hideAnimatedActivityIndicatorView()
            print("error")
#warning("Display the error")
        }
    }
}
