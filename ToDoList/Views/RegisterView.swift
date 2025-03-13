//
//  RegisterView.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 8.03.2025.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    
    var body: some View {
        
        VStack{
            
            
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, backgroundColor: .orange)
            
            
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                    
                TextField("Email Address", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $viewModel.password)
                TLButton(title: "Register", backgroundColor: .orange, action: {
                    viewModel.register()
                }).padding(10)
            }
            .offset(y: -50)
            
            
            
            
            Spacer()
        }
        
        
    }
}

#Preview {
    RegisterView()
}
