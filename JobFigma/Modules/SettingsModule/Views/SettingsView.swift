//
//  SettingsView.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 27.11.2023.
//

import SwiftUI
import Awesome

struct SettingsView: View {
    

    @ObservedObject var avm : AppViewModel
    
    var body: some View {
        NavigationView
        {
            VStack {
                VStack {
                    
                        
                        
                    Toggle(isOn: $avm.settings.notificationNewMessage , label: {
                            Text("Neue Nachricht")
                            Text("Lorem ipsum dolor sit amet")
                        })
                        .toggleStyle(SwitchToggleStyle(tint: Color("PrimaryThemeColor")))
                        .padding(.bottom)
                        
                        
                    Toggle(isOn: $avm.settings.notificationBewerbungAbgelehnt , label: {
                            Text("Bewerbung abgelehnt")
                            Text("Lorem ipsum dolor sit amet")
                        })
                        .toggleStyle(SwitchToggleStyle(tint: Color("PrimaryThemeColor")))
                        .padding(.bottom)
                        
                        Toggle(isOn: $avm.settings.notificationDarkMode , label: {
                            Text("Dark Mode")
                            Text("Lorem ipsum dolor sit amet")
                        })
                        .toggleStyle(SwitchToggleStyle(tint: Color("PrimaryThemeColor")))
                        .padding(.bottom)
                        
                    
                }
                .padding()
                
                Spacer()
            }
            .toolbar {
                
                
                
                ToolbarItem(placement: .principal) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Benachrichtigungen")
                            .font(.headline)
                            .foregroundColor(.primary)
                    })
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color("Light"))
        }
    }
}

#Preview {

    SettingsView(avm: AppViewModel())
}
