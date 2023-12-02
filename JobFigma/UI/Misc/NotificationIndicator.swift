//
//  NotificationIndicator.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 25.11.2023.
//

import SwiftUI

struct NotificationIndicator: View {
    let count: Int

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("PrimaryThemeColor")) 
                .frame(width: 24, height: 24)
            
            Text("\(count)")
                .foregroundColor(.white)
                .font(.caption)
        }
    }
}


#Preview {
    NotificationIndicator(count: 5)
}
