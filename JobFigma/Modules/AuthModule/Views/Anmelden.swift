//
//  Anmelden.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 23.11.2023.
//

import SwiftUI

struct Anmelden: View {
    var body: some View {
        VStack (alignment:.leading) {
            Spacer()
            VStack {
                HStack {
                    Text("Willkommen zurück!")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                
                Text("Melde dich an mit deine Email Adresse oder per Social Media")
                    
            } .multilineTextAlignment(.leading)
                .padding(.bottom,32)
            
            VStack {
                Fields(icon: "at", type: .textfield, placeholder: "E-Mail Adresse", isSecureField: false)
                Fields(icon: "lock", type: .textfield, placeholder: "Passwort", isSecureField: true)
                
                VStack {
                    ThemeButton(
                        iconLeft: false,
                        iconRight: true,
                        icon: "arrow.right",
                        text: "Anmelden",
                        type: .primary,
                        action: {
                            print("Button tapped")
                        }
                    )
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
                            print("google Login")
                        }
                    ) 
                    
                    ThemeButton(
                        iconLeft: false,
                        iconRight: true,
                        icon: "arrow.right",
                        text: "Anmelden",
                        type: .facebook,
                        action: {
                            print("facebook Login")
                        }
                    )
                    
                    Spacer()
                    
                } .padding(.top, 32) .padding(.bottom, 32)
               
            }
            
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Text("Bist du neu hier?")
                    Text("Registriere dich hier")
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
    Anmelden()
}
