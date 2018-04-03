//
//  Task.swift
//  Eisenhower
//
//  Created by Serge Heitzler on 29/03/2018.
//  Copyright © 2018 Serge Heitzler. All rights reserved.
//

import Foundation

enum TaskStatus {
    
    case urgentImportant
    case notUrgentButImportant
    case urgentButNotImportant
    case notUrgentNotImportant
    case unknown
    
    init(important: Bool, urgent: Bool) {
        
        self = .unknown
        if important && urgent { self = .urgentImportant }
        if important && !urgent { self = .urgentButNotImportant }
        if !important && urgent { self = .notUrgentButImportant }
        if !important && !urgent { self = .notUrgentNotImportant }
        
    }
}

class Task {
    
    public var status: TaskStatus {
        
        didSet {
            
            switch status {
                
            case .notUrgentButImportant:
                urgent = false
                important = true
            case .notUrgentNotImportant:
                urgent = false
                important = false
            case .urgentImportant:
                urgent = true
                important = true
            case .urgentButNotImportant:
                urgent = true
                important = false
            case .unknown:
                urgent = false
                important = false

            }
            
        }
        
    }
    
    public var objectId: String?
    
    public var urgent: Bool = false
    public var important: Bool = false
    
    public var title: String?
    public var desc: String?
    
    public var date: Date?
    
    init(status: TaskStatus = .unknown) {
        
        self.status = status
        
    }
    
    
    
    func save(completionHandler: @escaping (_ success: Bool) -> Void) {
        
        APIManager.shared.save(task: self) { (saved) in
                completionHandler(saved)
        }
        
    }
    
    func delete(completionHandler: @escaping (_ success: Bool) -> Void) {
        
        APIManager.shared.delete(task: self) { (saved) in
            completionHandler(saved)
        }
        
    }
    
}


extension Task: CustomDebugStringConvertible {
    
    var debugDescription: String {
        return "\(String(describing: objectId)) | is urgent -> (\(urgent)) & is important -> (\(important)"
    }
    
}
