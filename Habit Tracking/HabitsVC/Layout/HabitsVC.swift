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
    
    @IBAction func addBtnClicked(_ sender: UIBarButtonItem) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddHabitVC") as? AddHabitVC {
            vc.onHabitAdded = { [weak self] in
                guard let self = self else { return }
                displayAnimatedActivityIndicatorView()
                self.viewModel.list()
            }
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: false)
        }
    }
}
