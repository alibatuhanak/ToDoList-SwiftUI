


import Foundation
import FirebaseAuth



class LoginViewModel: ObservableObject {
    
    
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = ""
    
    init() {
       
    }
    
    func login(){
      
        guard validate() else {
            return
        }
        
        // try log in
        
    
        AuthService.shared.authenticate(email: email, password: password) { result in
            switch result {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                break
            case .success(let bool):
                
                guard bool else {
                    self.errorMessage = "can not access user."
                    print(bool)
                    return
                }
                print(bool)
                
                break
          
                
            }
        }
        
        
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        print("loggg")
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "please enter valid email."
            return false
            
        }
        
        return true
        
        
    }
    
    
    
    
    
}
