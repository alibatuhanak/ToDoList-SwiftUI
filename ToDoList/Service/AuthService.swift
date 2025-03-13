//
//  AuthService.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 10.03.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    static let shared = AuthService()
    
    
    private init(){}
    
    
    func authenticate(email: String, password: String,  completion: @escaping (Result<Bool, Error>)-> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let result else {
                completion(.success(false))
                return
            }
            
       
                completion(.success(true))
                
                return
            
      
            
            
        }
        
    }
    
    func signUp(name: String, email: String, password: String, completion: @escaping ( Result<Bool, Error>)-> Void) {

        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            
            if let error {
                completion(.failure(error))
                return
            }
            
      
            guard let userId = result?.user.uid else {
                completion(.success(false))
                return
            }
            
            let user = User(id: userId, name: name, email: email, joined: Date().timeIntervalSince1970)
           
            guard ((self?.insertUserRecord(user)) != nil) else { return }
            
            completion(.success(true))
            
            
        }
        
        
        
        
    }
    
    private func insertUserRecord(_ newUser: User) -> Bool{
        
           let db = Firestore.firestore()
           let ref = db.collection("users")
        
        
        ref.document(newUser.id).setData(newUser.asDictionary()){ error in
            if let error {
                print(error.localizedDescription)
                return
            }
            
            
        }
        return true
        
    }
    
    
}
