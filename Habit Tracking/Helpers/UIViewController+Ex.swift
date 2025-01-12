//
//  UIViewController+Ex.swift
//  Habit Tracking
//
//  Created by Hendawi on 12/01/2025.
//

import UIKit

extension UIViewController {
    func displayAlert(title: String, message: String, handler: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            handler()
        }))
        self.present(alert, animated: true)
    }
}
