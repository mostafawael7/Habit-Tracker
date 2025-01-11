//
//  ViewController.swift
//  Habit Tracking
//
//  Created by Hendawi on 11/01/2025.
//

import UIKit
import FirebaseFirestore

class HabitsVC: UIViewController {
    let viewModel = HabitsViewModel()
    
    @IBOutlet weak var noDataImg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    let cellID = "HabitTableCell"
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()

        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        displayAnimatedActivityIndicatorView()
        viewModel.list()
    }
}