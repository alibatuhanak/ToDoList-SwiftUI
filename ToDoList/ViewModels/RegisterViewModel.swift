


import Foundation
import FirebaseAuth



class RegisterViewModel: ObservableObject {
    
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    
    init(){}
    
    
    func register(){
        
        guard validate() else {
            return
        }
        
        
        AuthService.shared.signUp(name: name, email: email, password: password) { result in
            switch result {
            case .success(let bool):
                guard bool else {
                print("somethings gone wrong.")
                    return
                }
                
                print("successfully registered.")
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
                
            }
        }
        
        
        
    }
    
    func validate()->Bool{
        
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            
            return false
        }
        
        guard email.contains("@") &&  email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
    
}





