//
//  Anmelden.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 23.11.2023.
//

import SwiftUI

struct Registrieren: View {
    var body: some View {
        VStack (alignment:.leading) {
            Spacer()
            VStack {
                HStack {
                    Text("Erstelle deinen Account")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                
                Text("Registriere dich mit deiner Email Adresse oder per Social Media")
                    
            } .multilineTextAlignment(.leading)
                .padding(.bottom,32)
            
            VStack {
                Fields(icon: "at", type: .textfield, placeholder: "E-Mail Adresse", isSecureField: false)
                Fields(icon: "lock", type: .textfield, placeholder: "Passwort", isSecureField: true)
                Fields(icon: "lock", type: .textfield, placeholder: "Passwort wiederholen", isSecureField: true)
                
                VStack {
                    ThemeButton(
                        iconLeft: false,
                        iconRight: true,
                        icon: "arrow.right",
                        text: "Account erstellen",
                        type: .primary,
                        action: {
                            print("Button tapped")
                        }
                    )
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
                            print("google Register")
                        }
                    )
                    
                    ThemeButton(
                        iconLeft: false,
                        iconRight: true,
                        icon: "arrow.right",
                        text: "Anmelden",
                        type: .facebook,
                        action: {
                            print("facebook Register")
                        }
                    )
                    
                    Spacer()
                    
                } .padding(.top, 32) .padding(.bottom, 32)
               
            }
            
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Text("Hast du bereits einen Account?")
                    Text("Melde dich an")
                        .fontWeight(.bold)
                        
                    
                    Spacer()
                }
                .opacity(0.5)
                .font(.footnote)
            }
            
        } .padding() .background(Color("Light"))
    }
}

#Preview {
    Registrieren()
}
