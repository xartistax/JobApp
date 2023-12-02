//
//  ContentView.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 24.11.2023.
//

import SwiftUI
import SideMenu


enum ViewOption: String {
    case welcomeView = "WelcomeView"
    case anmeldenView = "AnmeldenView"
    case registrierenView = "RegistrierenView"
    case mainView = "MainView"
    case messagesView = "MessagesView"
    case profilView = "ProfilView"
    case settingsView = "SettingsView"
    
}

struct ContentView: View {
    @State private var item: Int = 0
    @ObservedObject var avm = AppViewModel()
    
    
    var body: some View {
        
        ZStack {
            
            getView()
            Spacer()
             
            if avm.selectedView != .anmeldenView && avm.selectedView != .registrierenView && avm.selectedView != .welcomeView && !avm.settings.isMenuOpen {
                
                VStack {
                    Spacer()
                    if !avm.settings.isMenuOpen {
                        
                        CustomToolbar(avm: avm)
                                    
                                                
                            .transition(.move(edge: .bottom)) // Animate the toolbar movement
                    
                    }
                    
                }
                .frame(alignment: .bottom)
                
            }
            
        }
    }
                
      
    
    @ViewBuilder
    func getView() -> some View {
        
        VStack {
            
            
            
            Group {
                switch avm.selectedView {
                    
                case .welcomeView:
                    WelcomeView(avm: avm)
                case .anmeldenView:
                    Anmelden(avm: avm)
                case .registrierenView:
                    Registrieren(avm: avm)
                case .mainView:
                    RootView(avm: avm)
                    
                    
                   
                    
                    
                    
                    
                case .messagesView:
                    ChatListView()
                case .profilView:
                    ProfileView(avm: avm, nameField: "Ganzer Name",
                                emailField: "Email",
                                passwortField: "123",
                                passwortRepeatField: "123")
                case .settingsView:
                    SettingsView(avm: avm)
                    
                }
            }
        }
    }
    
    
}










#Preview {
    ContentView(avm: AppViewModel())
}
