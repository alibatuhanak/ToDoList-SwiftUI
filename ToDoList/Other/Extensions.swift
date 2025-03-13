//
//  Extensions.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 11.03.2025.
//

import Foundation


extension Encodable {
    
    func asDictionary()->[String: Any] {
        
        guard let jsonData = try?  JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
            return json ?? [:]
        }catch {
            print(error)
            return [:]
        }
        
        
    }
    
}
