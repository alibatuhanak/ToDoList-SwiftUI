import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel : ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    
    init(){}
    
    func save(){
        guard  canSave() else {
            return
        }
        
        // get current userid
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        
        
       // create model
        let newId = UUID().uuidString
        let newItem : ToDoListItem = .init(id: newId, title: self.title, dueDate: self.dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        // save model
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
        
    }
    
    func canSave() -> Bool {
        
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
            
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        
        
        return true
        
    }
    
}
