//
//  Avatar.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 24.11.2023.
//

import SwiftUI

struct Avatar: View {
    
    let name : String
    let size : CGFloat
    
    var body: some View {
        ZStack {
                    Circle()
                        .foregroundColor(Color("PrimaryThemeColor")) // Set your default color
                        .frame(width: size, height: size) // Adjust size as needed
                        .overlay(Text(name.prefix(1)) // Display first character of the name
                                    .foregroundColor(.white)
                                    .font(.headline))

                    if let image = UIImage(named: name) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size, height: size) // Adjust image size
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2)) // Add border if desired
                            .shadow(radius: 2) // Add shadow if desired
                    }
                }
    }
}

#Preview {
    Avatar(name: "Avatar0", size: 45)
}
