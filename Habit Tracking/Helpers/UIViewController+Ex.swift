//
//  UIViewController+Ex.swift
//  Habit Tracking
//
//  Created by Hendawi on 12/01/2025.
//

import UIKit

extension UIViewController {
    func displayAlert(title: String, message: String, handler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            handler?() // Call the handler if it's provided
        }))
        self.present(alert, animated: true)
    }
}
