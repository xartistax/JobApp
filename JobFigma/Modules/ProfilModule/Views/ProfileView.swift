//
//  ProfileView.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 27.11.2023.
//

import SwiftUI
import Awesome

struct ProfileView: View {
    
    @ObservedObject var avm : AppViewModel
    
    @State var nameField : String
    @State var emailField : String
    @State var passwortField : String
    @State var passwortRepeatField : String
    
    var isProfileChangeEnabled: Bool {
            !nameField.isEmpty && !emailField.isEmpty && !passwortField.isEmpty && !passwortRepeatField.isEmpty
        }
    
    
    var body: some View {
        NavigationView
        {
            VStack {
                VStack {
                    
                    VStack {
                        Avatar(name: avm.user.avatar ?? avm.user.name, size: 120)
                        Text(avm.user.name).font(.largeTitle)
                        Text("Profil bearbeiten").font(.caption)
                            .foregroundColor(Color(UIColor.placeholderText))
                    }
                    
                    VStack {
                        Fields(icon: "", type: .textfield, placeholder: "Name", isSecureField: false, keyboardType: .default, text: $nameField)
                        Fields(icon: "", type: .textfield, placeholder: "Email Adresse", isSecureField: false, keyboardType: .emailAddress, text: $emailField)
                        Fields(icon: "", type: .textfield, placeholder: "Passwort", isSecureField: true, keyboardType: .default, text: $passwortField)
                        Fields(icon: "", type: .textfield, placeholder: "Passwort wiederholen", isSecureField: true, keyboardType: .default, text: $passwortRepeatField)
                    }
                    .padding()
                    
                    
                    VStack {
                        ThemeButton(
                            iconLeft: false,
                            iconRight: true,
                            icon: "arrow.right",
                            text: "Speichern",
                            type: .primary,
                            action: {
                                // print(email)
                                // print(password)
                                
                               
                            }
                        )
                        .disabled(!isProfileChangeEnabled)
                        .background( isProfileChangeEnabled ? Color("PrimaryThemeColor") : Color("PrimaryThemeColor").opacity(0.5) )
                        .cornerRadius(10)
                    }
                    .padding()
                    
                    Spacer()
                    
                }
                .toolbar {
                    
                    
                    
                    ToolbarItem(placement: .principal) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Profil")
                                .font(.headline)
                                .foregroundColor(.primary)
                        })
                    }
                }
            } 
            .frame(maxWidth: .infinity)
            .background(Color("Light"))
        }
    }
}

#Preview {
    ProfileView(
        avm: AppViewModel(),
        nameField: "Ganzer Name",
        emailField: "Email",
        passwortField: "123",
        passwortRepeatField: "123"
    )
}
