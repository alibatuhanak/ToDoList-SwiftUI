//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 8.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
   
    init(userId: String = "" ){
        guard !userId.isEmpty else {
            fatalError("error userid is not found.")
            
        }
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue:     ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item).swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            viewModel.delete(id: item.id)
                        } label: {
                            Text("Delete")
                        }.tint(.red)
                    }
                    
                }.listStyle(.plain)
                
                
            }.navigationTitle("To Do List")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            viewModel.showingNewItemView = true
                        } label: {
                            Image(systemName: "plus")
                        }

//                        NavigationLink {
//                            NewItemView()
//                        } label: {
//                      
//                            
//                                Image(systemName: "plus")
//                        }

                

                    }
                }
                
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    if #available(iOS 16.0, *) {
                        NewItemView(newItemPresented: $viewModel.showingNewItemView) .presentationDetents([
                            .medium,
                            .height(UIScreen.main.bounds.height*2/3)])
                            .presentationDragIndicator(.visible)
                    } else {
                        // Fallback on earlier versions
                    }
                }
                
        }
    }
    
    

}

struct ContentView5: View {
    @State private var offset: CGFloat = 300
    @State private var isSheetVisible = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Show Bottom Sheet") {
                    withAnimation {
                        offset = 0
                        isSheetVisible = true
                    }
                }
            }

            if isSheetVisible {
                VStack {
                    Spacer()
                    VStack {
                        Text("This is a bottom sheet")
                            .font(.title)
                            .padding()

                        Button("Close") {
                            withAnimation {
                                offset = 300
                                isSheetVisible = false
                            }
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .offset(y: offset)
                    .gesture(DragGesture().onChanged { value in
                        if value.translation.height > 0 {
                            offset = value.translation.height + 300
                        }
                    })
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: offset)
            }
        }
    }
}

@available(iOS 16.0, *)
struct ContentView: View {
    let items = ["Apple", "Banana", "Cherry"]
    
    @State private var selection: String? = nil // Seçilen öğeyi takip et

    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink(item, value: item)
                    Text(item)
                
            }
            .navigationDestination(for: String.self) { item in
                Text("Detay: \(item)") // Burada seçilen öğeyi göster
                    .font(.title)
                    .padding()
            }
            .navigationTitle("Fruits")
        }
    }
}

struct ContentView2: View {
    let items = ["Apple", "Banana", "Cherry"]
    
    @State private var selection: String? = nil // Seçilen öğeyi takip et

    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(destination: Text("Detay: \(item)")
                                .font(.title)
                                .padding()) {
                    Text(item)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct BottomSheet: View {
    @State private var offset: CGFloat = 300
    @State private var isSheetVisible = false

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.height < 0 { // Yukarı kaydırınca aç
                                withAnimation {
                                    offset = 0
                                    isSheetVisible = true
                                }
                            }
                        }
                )

            if isSheetVisible {
                BottomSheetView(offset: $offset, isSheetVisible: $isSheetVisible)
                    .transition(.move(edge: .bottom))
            }
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct BottomSheetView: View {
    @Binding var offset: CGFloat
    @Binding var isSheetVisible: Bool

    var body: some View {
        VStack {
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray)
                .padding(.top, 10)

            Text("This is a bottom sheet")
                .font(.title)
                .padding()

            Spacer()
        }
        .frame(height: 300)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
        .offset(y: offset)
        .gesture(
            DragGesture()
                .onChanged { value in
                    if value.translation.height > 0 { // Aşağı çekme hareketi
                        offset = value.translation.height
                    }
                }
                .onEnded { value in
                    if value.translation.height > 150 { // 150px'den fazla çekildiyse kapat
                        closeSheet()
                    } else {
                        withAnimation {
                            offset = 0 // Eski konumuna dönsün
                        }
                    }
                }
        )
        .onAppear {
            withAnimation {
                offset = 0 // Açılınca yukarı çıksın
            }
        }
    }

    private func closeSheet() {
        withAnimation {
            offset = 300
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isSheetVisible = false
        }
    }
}
#Preview {
    ToDoListView()
        // Fallback on earlier versions
}

