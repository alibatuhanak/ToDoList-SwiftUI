//
//  LoginView.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 8.03.2025.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
 
    init(){
        print("login")
    }
    
    var body: some View {
        NavigationView {
            
        VStack {
            // HEADER
            
            HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, backgroundColor: .pink)
     
            // LOGIN FORM
    
       
            
            
            Form {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                }
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(.automatic)//.listRowBackground(Color.black)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.automatic)
                
         
                TLButton(title: "Login", backgroundColor: .pink){
                    viewModel.login()
                }
            }

            // Create Account
            
            
            VStack {
                Text("New around here?")
                NavigationLink("Create An Account", destination: RegisterView())
            }.padding(.bottom, 50)
            
            
        //    Spacer()
            
            
            
        }//.ignoresSafeArea(.all, edges: .top)//.navigationTitle("leblebi").navigationBarTitleDisplayMode(.inline)
        
        
        }
    }
}

#Preview {
    LoginView()
}

//
//ZStack(alignment: .top) {
//    Text("Birinci öğe")
//        .padding()
//        .background(Color.red)
//        .frame(width: 200, height: 50) // Boyut ekleyerek hizalamayı sağlıyoruz
//        .alignmentGuide(.top) { a in
//            50
//        }
//
//    Text("İkinci öğe")
//        .padding()
//        .background(Color.green)
//        .frame(width: 200, height: 50) // Boyut ekleyerek hizalamayı sağlıyoruz
//
//    Text("Üçüncü öğe")
//        .padding()
//        .background(Color.blue)
//        .frame(width: 200, height: 50) // Boyut ekleyerek hizalamayı sağlıyoruz
//}
//.frame(width: 300, height: 300)
//.background(Color.gray)
