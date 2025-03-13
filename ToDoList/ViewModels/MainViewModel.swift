import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    @Published var isUserLoggedIn: Bool = false
    @Published var isLoading: Bool = true
    //private var handler:  AuthStateDidChangeListenerHandle?
    
    init(){
//        self.handler = Auth.auth().addStateDidChangeListener {[weak self] auth, user in
//            DispatchQueue.main.async {
//                self?.currentUserId = user?.uid ?? ""
//                
//            }
//            
//            
//        }
       
        
        Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                   self?.currentUserId = user?.uid ?? ""
                
                   self?.isUserLoggedIn = user != nil
                self?.isLoading = false
               }
            
        }
        
        self.isUserLoggedIn = Auth.auth().currentUser != nil
        
    }
    
    
    
    
//    public var isSignedIn: Bool {
//        return Auth.auth().currentUser != nil
//    }
    
    
}
