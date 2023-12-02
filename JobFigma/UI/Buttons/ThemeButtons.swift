//
//  BtnMain.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 23.11.2023.
//

import SwiftUI

enum BtnType {
    case primary
    case roundIcon
    case facebook
    case google
}

struct BtnMain: View {
    
    
    
    var iconLeft : Bool?
    var iconRight : Bool?
    var icon : String?
    var text : String?
    var type : BtnType
    var action: () -> Void
    
    var body: some View {
        VStack {
            
            switch type {
                case .primary:
                    VStack {
                        Button(action: {action()}, label: {
                            HStack {
                                if iconLeft ?? false {
                                    Image(systemName: icon ?? "")
                                }
                                Text(text ?? "Btn Text")
                                    .padding(.horizontal, 8)
                                if iconRight ?? false {
                                    Image(systemName: icon ?? "")
                                }
                                
                                
                            }
                        })
                    }
                    .padding(.horizontal, 100)
                    .padding(.vertical, 16)
                    .background(Color("Primary"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                
            case .roundIcon:
                VStack {
                    Button(action: {action()}, label: {
                        Image(systemName: icon ?? "plus")
                    })
                }
                
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color("Primary"))
                .cornerRadius(100)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                
            
            case .facebook:
                VStack {
                    HStack {
                        Image(systemName: "f.square.fill")
                        Text("Anmelden mit Facebook")
                    }
                }
                
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color("Primary"))
                .cornerRadius(10)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                
                
                
            case .google:
                VStack {
                    HStack {
                        Image(systemName: "g.square.fill")
                        Text("Anmelden mit Google")
                    }
                }
                
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color("Primary"))
                .cornerRadius(10)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                
                
            }
            
        }
    }
}

#Preview {

    Group {
        VStack {
            Text ("Primary Buttons")
            
        }
        .padding(.vertical)
        
        BtnMain(
            iconLeft: false,
            iconRight: true,
            icon: "arrow.right",
            text: "Anmelden",
            type: .primary,
            action: {
                print("Button tapped")
            }
        )
        BtnMain(
            iconLeft: true,
            iconRight: false,
            icon: "arrow.left",
            text: "Anmelden",
            type: .primary,
            action: {
                print("Button tapped")
            }
        )
        
        
        VStack {
            Text ("Round Button with Icon")
            
        }
        .padding(.vertical)
        

            BtnMain(
                icon: "plus",
                type: .roundIcon,
                action: {
                    print("Button tapped")
                }
            )
        
        VStack {
            Text ("Social Media Login Buttons")
            
        }
        .padding(.vertical)
        
        BtnMain(
            icon: "plus",
            type: .facebook,
            action: {
                print("Button tapped")
            }
        )
        
        
        BtnMain(
            icon: "plus",
            type: .google,
            action: {
                print("Button tapped")
            }
        )
            
           
            
        
    }
    
}
