//
//  BtnMain.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 23.11.2023.
//

import SwiftUI
import Awesome

enum BtnType {
    case primary
    case roundIcon
    case filterIcon
    case menuIcon
    case facebook
    case google
}

struct ThemeButton: View {
    
    
    
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
                    Button(action: { action() }, label: {
                        HStack {
                            Spacer()
                            if iconLeft ?? false {
                                Image(systemName: icon ?? "")
                            }
                            
                            Text(text ?? "Btn Text")
                                .padding(.horizontal, 8)
                            if iconRight ?? false {
                                Image(systemName: icon ?? "")
                            }
                            Spacer() // Add Spacer to expand and fill available width
                        }
                    })
                    .padding(.horizontal, 16) // Adjust horizontal padding as needed
                    .padding(.vertical, 16)
                    
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
               
                .frame(maxWidth: .infinity)
                
                
                
            case .roundIcon:
                VStack {
                    Button(action: {action()}, label: {
                        Image(systemName: icon ?? "plus")
                    })
                }
                
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color("PrimaryThemeColor"))
                .cornerRadius(100)
                .foregroundColor(.white)
                
            
            
            case .menuIcon:
                VStack {
                    Button(action: {action()}, label: {
                        Awesome.Solid.bars.image
                            .foregroundColor(.white)
                    })
                }
                .frame(minWidth: 24, minHeight: 24)
                .padding(.horizontal, 12)
                .padding(.vertical,12)
                .background(Color("PrimaryThemeColor"))
                .cornerRadius(4)
                
                
            
            case .filterIcon:
                VStack {
                    Button(action: {action()}, label: {
                        Awesome.Solid.slidersH.image
                            .foregroundColor(.white)
                    })
                }
                .frame(minWidth: 24, minHeight: 24)
                .padding(.horizontal, 12)
                .padding(.vertical,12)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(4)
                
                
  
                
            
            case .facebook:
                Button(action: {action()}, label: {
                    HStack {
                        Awesome.Brand.facebookF.image
                            .foregroundColor(.white)
                    }
                    
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(100)
                    .foregroundColor(.white)
                })
                
                
                
            case .google:
                Button(action: {action()}, label: {
                    HStack {
                        
                        Awesome.Brand.google.image
                            .foregroundColor(.white)
                    }
                    
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(100)
                    .foregroundColor(.white)
                })
               
                
                
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
        
        ThemeButton(
            iconLeft: false,
            iconRight: true,
            icon: "arrow.right",
            text: "Anmelden",
            type: .primary,
            action: {
                print("Button tapped")
            }
        ) .background(Color("PrimaryThemeColor"))
        ThemeButton(
            iconLeft: true,
            iconRight: false,
            icon: "arrow.left",
            text: "Anmelden",
            type: .primary,
            action: {
                print("Button tapped")
            }
        ) .background(Color("PrimaryThemeColor"))
        
        
        VStack {
            Text ("Round Button with Icon")
            
        }
        .padding(.vertical)
        

        ThemeButton(
                icon: "plus",
                type: .roundIcon,
                action: {
                    print("Button tapped plus")
                }
            )
        
        VStack {
            Text ("Square Button with Icon")
            
        }
        .padding(.vertical)
        
        HStack (spacing:5) {
            
            ThemeButton(
                icon: "plus",
                type: .filterIcon ,
                action: {
                    print("Button tapped plus")
                }
            )
            
            ThemeButton(
                icon: "plus",
                type: .menuIcon ,
                action: {
                    print("Button tapped plus")
                }
            )
            
        }
        
        VStack {
            Text ("Social Media Login Buttons")
            
        }
        .padding(.vertical)
        
        HStack (spacing:5) {
            
           
            ThemeButton(
                icon: "plus",
                type: .facebook,
                action: {
                    print("Button tapped")
                }
            )
           
            
            
            ThemeButton(
                icon: "plus",
                type: .google,
                action: {
                    print("Button tapped")
                }
            ) 
            
            
        }
           
            
        
    }
    
}
