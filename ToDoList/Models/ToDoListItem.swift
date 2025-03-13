//
//  User.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 8.03.2025.
//

import Foundation


struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
    
    
}
