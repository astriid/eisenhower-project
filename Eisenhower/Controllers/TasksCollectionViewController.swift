//
//  TasksCollectionViewController.swift
//  Eisenhower
//
//  Created by Serge Heitzler on 29/03/2018.
//  Copyright © 2018 Serge Heitzler. All rights reserved.
//

import UIKit

private let taskCellReuseIdentifier = "TaskCell"
private let addCellReuseIdentifier = "AddTaskCell"

class TasksCollectionViewController: UICollectionViewController {

    private var selectedTask: Task?
    private var tasks = [Task]() {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView?.register(UINib(nibName: "AddTaskViewCell", bundle: nil), forCellWithReuseIdentifier: addCellReuseIdentifier)
        self.collectionView?.register(UINib(nibName: "TaskViewCell", bundle: nil), forCellWithReuseIdentifier: taskCellReuseIdentifier)
                
        APIManager.shared.getTasks { (tasks) in
            self.tasks = tasks
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let vc = segue.destination as? TaskViewController {
            vc.task = selectedTask
            vc.delegate = self
        }
        
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return tasks.count + 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: addCellReuseIdentifier, for: indexPath) as! AddTaskViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: taskCellReuseIdentifier, for: indexPath) as! TaskViewCell
            cell.configure(with: tasks[indexPath.row - 1])
            return cell
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath.row == 0 { selectedTask = nil }
        else { selectedTask = tasks[indexPath.row - 1] }
        
        self.performSegue(withIdentifier: "taskSegue", sender: self)
        
    }

}

extension TasksCollectionViewController: TaskDelegate {
    
    func shouldAdd(task: Task) {
        self.tasks.append(task)
    }
    
    func shouldUpdate() {
        APIManager.shared.getTasks { (tasks) in
            self.tasks = tasks
        }
    }
    
}
