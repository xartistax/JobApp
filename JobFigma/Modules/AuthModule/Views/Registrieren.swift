//
//  Anmelden.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 23.11.2023.
//

import SwiftUI

struct Registrieren: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordRepeat: String = ""
    @ObservedObject var avm : AppViewModel
    
    var isRegistrationEnabled: Bool {
            !email.isEmpty && !password.isEmpty && !passwordRepeat.isEmpty && password == passwordRepeat
        }
    
    var body: some View {
        

        
        VStack (alignment:.leading) {
            Spacer()
            VStack (alignment:.leading) {
                HStack {
                    Text("Erstelle deinen Account")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                
                Text("Registriere dich mit deiner Email Adresse oder per Social Media")
                    .fontWeight(.light)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    
            } .multilineTextAlignment(.leading)
                .padding(.bottom,32)
            
            VStack {
                Fields(icon: "at", type: .textfield, placeholder: "E-Mail Adresse", isSecureField: false, keyboardType: .emailAddress, text: $email)
                Fields(icon: "lock", type: .password, placeholder: "Passwort", isSecureField: true, keyboardType: .default, text: $password)
                Fields(icon: "lock", type: .password, placeholder: "Passwort wiederholen", isSecureField: true, keyboardType: .default, text: $passwordRepeat)
                
                VStack {
                    ThemeButton(
                        iconLeft: false,
                        iconRight: true,
                        icon: "arrow.right",
                        text: "Account erstellen",
                        type: .primary,
                        action: {
                            // print(email)
                            // print(password)
                            
                            avm.selectedView = .mainView
                        }
                    )
                    .disabled(!isRegistrationEnabled)
                    .background( isRegistrationEnabled ? Color("PrimaryThemeColor") : Color("PrimaryThemeColor").opacity(0.5) )
                    .cornerRadius(10)
                    
                            
                    
                } .padding(.top,16) .padding(.bottom, 64)
                
                VStack {
                    Text ("-- oder Registrieren mit --")
                        .foregroundColor(Color(UIColor.placeholderText))
                }
                
                
                HStack {
                   
                    Spacer()
                    
                    ThemeButton(
                        iconLeft: false,
                        iconRight: true,
                        icon: "arrow.right",
                        text: "Anmelden",
                        type: .google,
                        action: {
                            avm.selectedView = .mainView
                        }
                    )
                    
                    ThemeButton(
                        iconLeft: false,
                        iconRight: true,
                        icon: "arrow.right",
                        text: "Anmelden",
                        type: .facebook,
                        action: {
                           
                            
                            avm.selectedView = .mainView
                        }
                    )
                    
                    Spacer()
                    
                } .padding(.top, 32) .padding(.bottom, 32)
               
            }
            
            Spacer()
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        avm.selectedView = .anmeldenView
                    }){
                        Text("Hast du bereits einen Account?")
                        Text("Melde dich an")
                            .fontWeight(.bold)
                    } .disabled(false)
                    
                    
                    
                    Spacer()
                }
                .foregroundColor(.black)
                .opacity(0.5)
                .font(.footnote)
                
                
               
            }
            
        } .padding() .background(Color("Light"))
    }
}




#Preview {
    Registrieren(avm: AppViewModel())
}
