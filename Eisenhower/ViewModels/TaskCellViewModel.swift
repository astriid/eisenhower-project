//
//  TaskCellViewModel.swift
//  Eisenhower
//
//  Created by Serge Heitzler on 29/03/2018.
//  Copyright © 2018 Serge Heitzler. All rights reserved.
//

import UIKit

struct TaskCellViewModel {
    
    var backgroundColor: UIColor
    var importantAlpha: CGFloat
    var urgentAlpha: CGFloat
    
    init(for task: Task) {
        
        switch task.status {
            
        case .notUrgentButImportant:
            urgentAlpha = 0.4
            importantAlpha = 1.0
            backgroundColor = .blueTaskCell
            
        case .notUrgentNotImportant:
            urgentAlpha = 0.4
            importantAlpha = 0.4
            backgroundColor = .lightGreenTaskCell
            
        case .urgentButNotImportant:
            urgentAlpha = 1.0
            importantAlpha = 0.4
            backgroundColor = .greenTaskCell
            
        case .urgentImportant:
            urgentAlpha = 1.0
            importantAlpha = 1.0
            backgroundColor = .redTaskCell
            
        case .unknown:
            urgentAlpha = 0.0
            importantAlpha = 0.0
            backgroundColor = .redTaskCell
            
        }
        
    }
    
}
