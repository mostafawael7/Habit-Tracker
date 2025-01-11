//
//  HabitTableCell.swift
//  Habit Tracking
//
//  Created by Hendawi on 11/01/2025.
//

import UIKit

class HabitTableCell: UITableViewCell {

    @IBOutlet weak var statusImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(habit: HabitModel) {
        nameLbl.text = habit.name
        statusImg.image = habit.status ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "circle")
    }
}
