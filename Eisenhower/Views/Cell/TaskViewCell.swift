//
//  TaskViewCell.swift
//  Eisenhower
//
//  Created by Serge Heitzler on 29/03/2018.
//  Copyright © 2018 Serge Heitzler. All rights reserved.
//

import UIKit
import AFDateHelper

class TaskViewCell: UICollectionViewCell {

    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var important: UIImageView!
    @IBOutlet weak var urgent: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5.0
    }
    
    func configure(with task: Task) {
        
        let vm = TaskCellViewModel(for: task)
        self.backgroundColor = vm.backgroundColor
        self.important.alpha = vm.importantAlpha
        self.urgent.alpha = vm.urgentAlpha
        
        self.taskTitle.text = task.title
        self.date.text = task.date?.toString(format: .custom("MMMM d yyyy"))

    }
    
    override func prepareForReuse() {

        self.backgroundColor = .redTaskCell
        self.important.alpha = 1.0
        self.urgent.alpha = 1.0
        
    }

}
