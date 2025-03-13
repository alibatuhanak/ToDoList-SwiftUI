
import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListViewModel : ObservableObject{
    @Published var showingNewItemView: Bool = false
    
    private var userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
    
}
