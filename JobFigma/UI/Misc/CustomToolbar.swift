//
//  CustomToolbar.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 26.11.2023.
//

import SwiftUI
import Awesome


struct CustomToolbar: View {
    
    @ObservedObject var avm : AppViewModel
    
    @State private var homeColor: Color = .white
    @State private var homeOpacity: Double = 1.0
    
    
    
  var body: some View {
      
      
  
      
      HStack {
          
          HStack (spacing:32) {
              
              
              VStack{
                  Button(action: {
                      avm.selectedView = .mainView
                  }, label: {
                      VStack {
                          
                          if avm.selectedView == .mainView {
                              Awesome.Solid.home.image
                                  .foregroundColor(.white).opacity(1)
                              Text("Home")
                                  .foregroundColor(.white).opacity(1)
                                  .font(.caption)
                          } else {
                              Awesome.Solid.home.image
                                  .foregroundColor(.white).opacity(0.25)
                              Text("Home")
                                  .foregroundColor(.white).opacity(0.25)
                                  .font(.caption)
                          }
                          
                      }
                  })
              }
              
              
              
              VStack{
                  Button(action: {
                      avm.selectedView = .messagesView
                  }, label: {
                      VStack {
                          
                          if avm.selectedView == .messagesView {
                              Awesome.Solid.comment.image
                                  .foregroundColor(.white).opacity(1)
                              Text("Nachrichen")
                                  .foregroundColor(.white).opacity(1)
                                  .font(.caption)
                          } else {
                              Awesome.Solid.comment.image
                                  .foregroundColor(.white).opacity(0.25)
                              Text("Nachrichten")
                                  .foregroundColor(.white).opacity(0.25)
                                  .font(.caption)
                          }
                          
                      }
                  })
              }
              
              
              
              VStack{
                  Button(action: {
                      avm.selectedView = .profilView
                  }, label: {
                      VStack {
                          
                          if avm.selectedView == .profilView {
                              Awesome.Solid.user.image
                                  .foregroundColor(.white).opacity(1)
                              Text("Profile")
                                  .foregroundColor(.white).opacity(1)
                                  .font(.caption)
                          } else {
                              Awesome.Solid.user.image
                                  .foregroundColor(.white).opacity(0.25)
                              Text("Profile")
                                  .foregroundColor(.white).opacity(0.25)
                                  .font(.caption)
                          }
                          
                      }
                  })
              }
              
              
              
              
              VStack{
                  Button(action: {
                      avm.selectedView = .settingsView
                  }, label: {
                      VStack {
                          
                          if avm.selectedView == .settingsView {
                              Awesome.Solid.cog.image
                                  .foregroundColor(.white).opacity(1)
                              Text("Einstellungen")
                                  .foregroundColor(.white).opacity(1)
                                  .font(.caption)
                          } else {
                              Awesome.Solid.cog.image
                                  .foregroundColor(.white).opacity(0.25)
                              Text("Einstellungen")
                                  .foregroundColor(.white).opacity(0.25)
                                  .font(.caption)
                          }
                          
                      }
                  })
              }
              
              
            
              
              
         
              
              
              
              
              }
          
    }
      
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color("Slate")).opacity(1)
    .cornerRadius(8)
    .customBorder(cornerRadius: 8)
    .shadow(color: Color.black.opacity(0.05), radius: 15, x: 3, y: 6)
    .padding()
    .background(Color.gray.opacity(0.0))
  }
}

#Preview {
    CustomToolbar(avm: AppViewModel())
}
