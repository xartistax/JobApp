//
//  Anmelden.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 23.11.2023.
//

import SwiftUI

struct Anmelden: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject var avm : AppViewModel
    
    var isRegistrationEnabled: Bool {
            !email.isEmpty && !password.isEmpty
        }
    
    var body: some View {
        VStack (alignment:.leading) {
            Spacer()
            VStack (alignment:.leading) {
                HStack {
                    Text("Willkommen zurück!")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                
                Text("Melde dich an mit deine Email Adresse oder per Social Media")
                    .fontWeight(.light)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                
            } .multilineTextAlignment(.leading)
                .padding(.bottom,32)
            
            VStack {
                Fields(icon: "at", type: .textfield, placeholder: "E-Mail Adresse", isSecureField: false, keyboardType: .emailAddress, text: $email)
                Fields(icon: "lock", type: .password, placeholder: "Password", isSecureField : true, keyboardType: .default, text: $password)
                
                VStack {
                    ThemeButton(
                        iconLeft: false,
                        iconRight: true,
                        icon: "arrow.right",
                        text: "Anmelden",
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
                    Text ("-- oder Anmelden mit --")
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
                        avm.selectedView = .registrierenView
                    }){
                        Text("Bist du neu hier?")
                        Text("Registriere dich hier")
                            .fontWeight(.bold)
                    }
                    
                    
                    
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
    Anmelden(avm: AppViewModel())
}
