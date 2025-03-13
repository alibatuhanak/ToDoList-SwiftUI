//
//  ProfileView.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 8.03.2025.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel = .init()
    @State var number = 10
    init() {
        print("initialized22")
    }
    var body: some View {
        
        NavigationView {
            VStack(spacing: 40) {
                
                if let user = viewModel.user {
                    profile(user: user)
                }
                else {
                    Text("Profile is loading...")
                }
               
            }.padding(2).navigationTitle("Profile")
        }.onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
     
        ZStack {
            //                    Color.red
            //                        .frame(height: 100) // Kırmızı arka planın yüksekliği
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.white) // İkon rengini beyaz yap
                .frame(maxHeight: .infinity)
                .background(.yellow)
        }.frame(maxHeight: 125)
        
        
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Name: ").bold()
                Text(user.name)
            }
            HStack {
                Text("Email: ").bold()
                Text(user.email)
            }
            HStack {
                Text("Member since: ").bold()
                Text("\(Date(timeIntervalSince1970:  user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()
        
        Button(action: {
            viewModel.logOut()
            
        }) {
            Text("Log out")
                .foregroundColor(.red) // Yazı kırmızı
                .padding(8)
                .background(Color.white) // Arka plan beyaz
                .cornerRadius(10) // Köşeleri yuvarlat
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red, lineWidth: 2) // Kırmızı çerçeve
                )
        }
        .padding(.horizontal, 10)
        
        Spacer()
    }
    
}

struct GridExampleView: View {
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        
        
    ]
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                 LazyVGrid(columns: columns, spacing: 10) {
                     ForEach(1...12, id: \.self) { index in
                         Rectangle()
                             .fill(Color.blue)
                             .frame(height: 100)
                             .cornerRadius(10)
                             .overlay(Text("\(index)").foregroundColor(.white).bold())
                     }
                 }
            }.navigationTitle("asdsa").navigationBarTitleDisplayMode(.inline)
        }
     
    }
}
struct LazyVGridExample: View {
    let colors = [Color.blue, .green, .red, .pink, .orange, .teal, .purple, .gray, .yellow, Color.blue, .green, .red, .pink, .orange, .teal, .purple, .gray, .yellow, Color.blue, .green, .red, .pink, .orange, .teal, .purple, .gray, .yellow, Color.blue, .green, .red, .pink, .orange, .teal, .purple, .gray, .yellow, Color.blue, .green, .red, .pink, .orange, .teal, .purple, .gray, .yellow, Color.blue, .green, .red, .pink, .orange, .teal, .purple, .gray, .yellow]
    let columns = [GridItem(spacing: 20), GridItem(spacing: 20), GridItem(spacing: 20)]
    var body: some View {
        NavigationView
        {VStack{
           // Text("asdasda").background(.red)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20 ) {
                    Section(header: LazyVGridHeaderView()) {
                        ForEach(colors.indices, id: \.self) { idx in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(colors[idx])
                                .frame(height: 50)
                                .overlay(Text("\(idx)"))
                        }
                    }
                    Section(header: LazyVGridHeaderView()) {
                        ForEach(colors.indices, id: \.self) { idx in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(colors[idx])
                                .frame(height: 50)
                                .overlay(Text("\(idx)"))
                        }
                    }
                }
                
            }.padding([.top, .bottom],1)
        }.navigationTitle("")
        }
        
    }
}
struct LazyVGridHeaderView: View {
    var body: some View {
        VStack{
            
        Text("Sample Header")
            .font(.title3.bold())
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
        
        }.frame(width:250)
    }
}
struct LazyVGridFooterView: View {
    var body: some View {
        Text("Sample Footer")
            .font(.body.bold())
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
        
    }
}
#Preview {
    return ProfileView()
}



//
//struct ProfileView: View {
//    
//    @StateObject var viewModel: ProfileViewModel = .init()
//    @State var number = 10
//    init() {
//        print("initialized22")
//    }
//    var body: some View {
//        
//       
//            VStack {
//                GeometryReader { geometry in
//                    ZStack {
//                        Color.red
//                            .frame(height: geometry.size.height * 1) // Ekranın %20'si kadar
//                        Image(systemName: "person.circle")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundStyle(.white)
//                            .frame(height: geometry.size.height * 0.15) // Ekranın %15'i kadar
//                            .background(Color.yellow)
//                    }
//                }
//                .frame(height: 100)
//                Text("sadsa")
//                ZStack {
////                    Color.red
////                        .frame(height: 100) // Kırmızı arka planın yüksekliği
//                    Image(systemName: "person.circle")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundStyle(.white) // İkon rengini beyaz yap
//                        .frame(maxHeight: .infinity)
//                        .background(.yellow)
//                }.frame(maxHeight: 125)
//              
//
//                VStack(alignment: .leading, spacing: 8) {
//                    HStack {
//                        Text("Name: ")
//                        Text("Ali Batuhan Ak")
//                    }
//                    HStack {
//                        Text("Email: ")
//                        Text("Ali Batuhan Ak")
//                    }
//                    HStack {
//                        Text("Member since: ")
//                        Text("Ali Batuhan Ak")
//                    }
//                }
//                .padding()
//
//                Button(action: {
//                    viewModel.logOut()
//                }) {
//                    Text("Log out")
//                        .foregroundColor(.red) // Yazı kırmızı
//                        .padding(8)
//                        .background(Color.white) // Arka plan beyaz
//                        .cornerRadius(10) // Köşeleri yuvarlat
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.red, lineWidth: 2) // Kırmızı çerçeve
//                        )
//                }
//                .padding(.horizontal, 10)
//
//                Spacer()
//            }
//            .navigationTitle("Profile")
//
//    }
//    
//}
