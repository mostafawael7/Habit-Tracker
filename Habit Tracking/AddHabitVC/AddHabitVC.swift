//
//  AddHabitVC.swift
//  Habit Tracking
//
//  Created by Hendawi on 12/01/2025.
//

import UIKit

class AddHabitVC: UIViewController {
    let viewModel = HabitsViewModel()

    @IBOutlet weak var taskTextView: PlaceholderTextView!
    
    var onHabitAdded: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTextView.placeholder = "New Habit"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleViewDismiss))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleViewDismiss() {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func addBtnClicked(_ sender: UIButton) {
        if taskTextView.text == "" {
            return
        }
        viewModel.add(habit: taskTextView.text, onSuccess: {
            self.displayAlert(title: "Success!", message: "You have a new habit added!!", handler: {
                self.dismiss(animated: false)
            })
        }, onFailure: { error in
            self.displayAlert(title: "Error", message: error)
        })
    }
}
