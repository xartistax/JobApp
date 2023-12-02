//
//  ContentView.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 23.11.2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @ObservedObject var avm : AppViewModel
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image("WelcomeImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
            }
            
          
            VStack (alignment:.center) {
                Text ("Finde deine perfekte Stelle")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text ("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore. ")
                    .fontWeight(.light)
                    .padding(.bottom, 64)
                    .multilineTextAlignment(.center)
            }
            
            VStack {
                ThemeButton(
                    iconLeft: false,
                    iconRight: true,
                    icon: "arrow.right",
                    text: "Los gehts!",
                    type: .primary,
                    action: {
                        avm.selectedView = .anmeldenView
                    }
                )
                .background(Color("PrimaryThemeColor"))
                .cornerRadius(10)
            }
            Spacer() 
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color("Light")) 
    }
}

#Preview {
    WelcomeView(avm: AppViewModel())
}
