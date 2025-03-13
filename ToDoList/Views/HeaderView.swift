//
//  HeaderView.swift
//  ToDoList
//
//  Created by Ali Batuhan AK on 9.03.2025.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subTitle: String
    let angle: Double
    let backgroundColor: Color
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack( spacing: 12) {
               
                if #available(iOS 16.0, *) {
                    Text(title).font(.system(size: 50)).foregroundStyle(.white)
                        .bold()
                } else {
                    Text(title) .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                       
                }
              
                if #available(iOS 16.0, *) {
                    Text(subTitle).font(.system(size: 30)).foregroundStyle(.white)
                        .bold()
                } else {
                    Text(subTitle).font(.system(size: 30)).foregroundStyle(.white) .font(.system(size: 20, weight: .bold))
                }
                
                
            }
            .font(.largeTitle).padding(.top, 90)
            
            
            
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height / 3)
        .offset(y: -140)
       
    }
}
