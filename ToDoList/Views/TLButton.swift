//
//  TLButton.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 9.03.2025.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // attempt login
            action()
        } label: {
         
       ZStack{
           RoundedRectangle(cornerRadius: 15)
               .foregroundStyle(backgroundColor)
               .frame(maxWidth: .infinity)
                
            Text(title)
               .foregroundStyle(.white)
               .font(.system(size: 16, weight: .bold))
              // .frame(maxWidth: .infinity)
               //.multilineTextAlignment(.center)
               //.border(.black)
                   
                    
                
            }
            
        }
    }
}

