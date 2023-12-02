//
//  ChatListElement.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 25.11.2023.
//

import SwiftUI

struct ChatListElement: View {
    
  
    
    let name : String
    let text : String
    let avatar : String
    let count : Int
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Avatar(name: avatar, size: 45)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.headline)
                    Text(text).opacity(0.5)
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading) // Align content to leading edge
                
                if count > 0 {
                    
                    Spacer()
                    VStack {
                        NotificationIndicator(count: count)
                    }
                }
                
                
            }
            
            .padding(.horizontal,16)
            .padding(.vertical,16)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(8)
            .customBorder(cornerRadius: 8)
            .shadow(color: Color.black.opacity(0.05), radius: 15, x: 3, y: 6)
        }
        
    }
}
#Preview {
    VStack{
        Group {
            ChatListElement(name: "Rosanne Bars", text: "Lorem ipsum dolor sit amet", avatar: "Avatar", count: 7)
        }
        
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color("Light"))
    
}
