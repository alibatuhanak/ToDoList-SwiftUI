//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 8.03.2025.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
   
    var body: some View {
        
            
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding()
            
            
            
            Form {
                // title
                TextField("Title", text: $viewModel.title)
                    
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(.compact)
                
                TLButton(title: "Save", backgroundColor: .pink) {
                    if viewModel.canSave() {
                        
                        
                    
                    
                    viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
                }.padding()
                
            }.alert("Uyarı", isPresented: $viewModel.showAlert, presenting: "hataMesaji") { mesaj in
                    
                    Button("Hayır", role: .destructive){}
                Button("Tamam", role: .cancel) { }
            } message: { mesaj in
                Text(mesaj)
            }
            
            
            
            
        }
        
        
        
        
    }


//#Preview {
//    NewItemView(newItemPresented: Binding(get: {
//        return true
//    }, set: { _ in
//        
//    }))
//}
