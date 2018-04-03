//
//  APIManager.swift
//  Eisenhower
//
//  Created by Serge Heitzler on 29/03/2018.
//  Copyright © 2018 Serge Heitzler. All rights reserved.
//

import Foundation
import FirebaseDatabase

class APIManager {
    
    static var shared = APIManager()
    
    var ref = Database.database().reference()

    func getTasks(completionHandler: @escaping ([Task]) -> Void) {
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            
            var tasks = [Task]()

            let dico = snapshot.value as? [String:Any]
            
            let tasksDico = dico!["Tasks"] as? [String:Any]

            tasksDico?.forEach({ (key, value) in
                var json = value as! [String:Any]
                var task = Task()
                task.date = Date(timeIntervalSince1970: json["date"] as! TimeInterval)
                task.desc = json["desc"] as? String
                task.title = json["title"] as? String
                task.important = json["important"] as! Bool
                task.urgent = json["urgent"] as! Bool
                task.status = TaskStatus(important: task.important, urgent: task.urgent)
                tasks.append(task)
            })
            
            completionHandler(tasks)

        })
        
        
        
    }
    
    func save(task: Task, completionHandler: @escaping (_ success: Bool) -> Void) {
        
        let taskRef = ref
            .child("Tasks")
            .childByAutoId()
        
        let taskId = taskRef.key
        
        let post = ["title": task.title as Any,
                    "desc": task.desc as Any,
                    "important": task.important,
                    "urgent": task.urgent,
                    "date": task.date?.timeIntervalSince1970 as Any] as [String : Any]
        
        ref.child("Tasks").child(taskId).setValue(post) { (error, db) in
            if let _ = error {
                completionHandler(false)
            }
            else {
                completionHandler(true)
            }
        }
        
    }
    
    func delete(task: Task, completionHandler: @escaping (_ success: Bool) -> Void) {
        
        ref.child("Tasks").child(task.objectId!).removeValue() { (error, db) in
            if let _ = error {
                completionHandler(false)
            }
            else {
                completionHandler(true)
            }
        }
        
        
    }
    
}
