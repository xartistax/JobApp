//
//  Fields.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 23.11.2023.
//

import SwiftUI

enum FieldType {
    case textfield
    case password
}



struct Fields: View {
    var icon: String
    var type: FieldType
    var placeholder: String
    var isSecureField: Bool
    var keyboardType: UIKeyboardType
    @State private var showPassword = false
    @Binding var text: String
    
    var fieldPadding: Bool // Removed initialization here

        init(icon: String, type: FieldType, placeholder: String, isSecureField: Bool, keyboardType: UIKeyboardType, text: Binding<String>) {
            self.icon = icon
            self.type = type
            self.placeholder = placeholder
            self.isSecureField = isSecureField
            self.keyboardType = keyboardType
            self._text = text
            
            // Initialize fieldPadding based on the condition
            self.fieldPadding = icon.isEmpty
        }

    
    var body: some View {
        HStack {
            if (!icon.isEmpty) {
                Image(systemName: icon )
                    .padding()
                    .frame(width: 57)
                    .foregroundColor(.black.opacity(0.25))
                    .background(Color(UIColor.lightGray).opacity(0))
            }
            
            if isSecureField {
                
                if type == .password {
                    
                    if showPassword {
                                        TextField(placeholder, text: $text)
                                            .keyboardType(keyboardType)
                                    } else {
                                        SecureField(placeholder, text: $text)
                                            .keyboardType(keyboardType)
                                    }
                    
                    
                    
                } else {
                    TextField(placeholder, text: $text)
                        .keyboardType(keyboardType) // Apply keyboard type
                }
            } else {
                
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType) // Apply keyboard type
            }
            
            if type == .password {
                Button(action: {
                    // Implement toggle for password visibility
                    showPassword.toggle()
                }) {
                    Image(systemName: showPassword ? "eye" : "eye.slash")
                        .foregroundColor(  showPassword ? Color("PrimaryThemeColor") : Color(UIColor.placeholderText)  )
                    
                }
                .padding()
            }
        }
        .padding(fieldPadding ? .leading : [])
        .frame(minHeight: 50)
        .textContentType(.none) // Set text content type to none
        .autocapitalization(.none)
        .background(Color.white)
        .cornerRadius(8)
        .customBorder(cornerRadius: 8)
        .shadow(color: Color.black.opacity(0.05), radius: 15, x: 3, y: 6)
        
    }
}








struct CustomBorder: ViewModifier {
    var cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.black.opacity(0.15), lineWidth: 1)
            )
    }
}

extension View {
    func customBorder(cornerRadius: CGFloat) -> some View {
        self.modifier(CustomBorder(cornerRadius: cornerRadius))
    }
}



#Preview {
    Group {
        VStack {
            Text("Formfields").padding(.vertical)
            Fields(icon: "", type: .textfield, placeholder: "Username", isSecureField : false, keyboardType: .default , text: .constant(""))
            Fields(icon: "person", type: .textfield, placeholder: "Username", isSecureField : false, keyboardType: .default , text: .constant(""))
            Fields(icon: "at", type: .textfield, placeholder: "Email", isSecureField : false, keyboardType: .emailAddress, text: .constant(""))
            Fields(icon: "lock", type: .password, placeholder: "Password", isSecureField : true, keyboardType: .default, text: .constant(""))
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color("Light"))
    }
}
