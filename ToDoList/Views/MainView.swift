//
//  ContentView.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 7.03.2025.
//

import SwiftUI
import FirebaseAuth



struct MainView: View {
    
    @StateObject var viewModel: MainViewModel = MainViewModel()
    
    init() {
      
        print("main")
        UITabBar.appearance().unselectedItemTintColor = UIColor.red.withAlphaComponent(0.3)
      }
      
    var body: some View {
  
        
        
        if viewModel.isLoading {
            loadingView() 
        } else if viewModel.isUserLoggedIn {
            accountView
        } else {
            LoginView()
        }
            
            
    }
  //  let profile =  ProfileView()
    //let toDoList = ToDoListView(userId: viewModel.currentUserId)
   //let toDoList =
//    var toDoList: ToDoListView {
//         ToDoListView(userId: viewModel.currentUserId) // viewModel ile bağlı olduğu için computed property
//     }
    
    @ViewBuilder
    private func loadingView() -> some View {
        VStack{
        ProgressView()
        Text("Loading...")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.black.opacity(0.1))
    }
    
    
    @ViewBuilder
    var accountView: some View {
        
        TabView {
            if !viewModel.currentUserId.isEmpty {
                ToDoListView(userId: viewModel.currentUserId).tabItem {
                    Label("Home", systemImage: "house")
                }.foregroundStyle(.red)}
            ProfileView().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
     
  
            
        }.tint(.red).foregroundStyle(.yellow)
        
    }
    
}

#Preview {
 //   MainView()
}


//VStack {
//    
//    Text("sadas").background(.yellow)
//}
//.frame(maxWidth: .infinity)
//.background(.red).padding(EdgeInsets(top: 50, leading: 20, bottom: 20, trailing: 90)).background(.green).padding()
//
//VStack {
//    
//    VStack{
//        
//    Text("lelbebi")
//    Text("lelbebi")
//    }.background(.yellow)
//    
//    Spacer()
//    Text("lelbedbi")
//}.background(.yellow).frame(width: 150,height: 500)
//    }



//VStack {
//    
//    VStack{
//        
//        Text("lelbebi")
//        Text("lelbebi")
//    }.frame(width: 150,height: 500).background(.yellow)
//    
//    //Spacer()
//    VStack{
//        
//        Text("lelbebi")
//        Text("lelbebi")
//        
//    }
//    Spacer()
//}.background(.yellow)
