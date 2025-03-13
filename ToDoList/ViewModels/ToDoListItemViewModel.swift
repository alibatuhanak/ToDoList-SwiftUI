


import Foundation
import FirebaseAuth
import FirebaseFirestore


class ToDoListItemViewModel: ObservableObject {
    
    
    init(){
        
    }
    
    func toggleIsDone(item: ToDoListItem){
        //item.setDone(true)
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(item.id)
            .setData(itemCopy.asDictionary())
        
    }
    
    
    
}
