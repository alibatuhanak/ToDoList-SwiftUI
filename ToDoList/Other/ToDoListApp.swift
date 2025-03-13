//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 7.03.2025.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct ToDoListApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
  
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
