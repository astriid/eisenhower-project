//
//  TaskViewController.swift
//  Eisenhower
//
//  Created by Serge Heitzler on 29/03/2018.
//  Copyright © 2018 Serge Heitzler. All rights reserved.
//

import UIKit

enum PressedButtonType: Int {
    case Save
    case Delete
    case RenewPassword
    case Logout
}

protocol TaskDelegate {
    
    func shouldAdd(task: Task)
    func shouldUpdate()

}

public let profilePictureCellReuseIdentifier = "ProfilePictureCell"

class TaskViewController: UIViewController {

    var task: Task?
    var delegate: TaskDelegate?
    
    @IBOutlet weak var collectionView: ProfilePictureCollectionView!
    
    @IBOutlet weak var taskTitle: UITextView!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var taskDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: profilePictureCellReuseIdentifier)
        
        if let task = self.task {
            
            taskTitle.text = task.title
            taskDescription.text = task.desc
            taskDate.date = task.date!
            
        }
        
    }

    @IBAction func didPressButton(sender: UIButton) {
        
        if let _ = self.task {} else {
            self.task = Task(status: .unknown)
        }
        
        self.task!.title = taskTitle.text
        self.task!.desc = taskDescription.text
        self.task!.date = taskDate.date

        switch sender.tag {
        case PressedButtonType.Save.rawValue:
        task?.save(completionHandler: { (saved) in
            self.delegate?.shouldAdd(task: self.task!)
            self.navigationController?.popViewController(animated: true)
        })
        case PressedButtonType.Delete.rawValue:
        task?.delete(completionHandler: { (deleted) in
            self.delegate?.shouldUpdate()
            self.navigationController?.popViewController(animated: true)
        })
            
        default: break
        }

    }

}
