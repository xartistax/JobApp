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
    
    @State private var text: String = "" // State variable for text input
    
    init(icon: String, type: FieldType, placeholder: String) {
        self.icon = icon
        self.type = type
        self.placeholder = placeholder
        _text = State(initialValue: placeholder) // Initialize text with the placeholder
    }
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: icon)
                        .frame(maxHeight: 56)
                        .frame(maxWidth: 56)
                        .background(Color(UIColor.lightGray))
                        .foregroundColor(Color.white)
                    
                    TextEditor(text: $text)
                        .padding(8)
                        .frame(height: 56)
                        .foregroundColor(Color(UIColor.placeholderText))
                    
                    if type == .password {
                                        Image(systemName: "eye")
                                            .frame(maxHeight: 56)
                                            .frame(maxWidth: 56)
                                            .font(.system(size: 16))
                                            .foregroundColor(Color(UIColor.placeholderText))
                                    }
                }
                .background(Color.white)
                .cornerRadius(8)
            }
            .padding(.horizontal)
        }
    }
}




#Preview {
    Group {
        VStack {
            Text("Formfields").padding(.vertical)
            Fields(icon: "person", type: .textfield, placeholder: "Username")
            Fields(icon: "at", type: .textfield, placeholder: "Email")
            Fields(icon: "lock", type: .password, placeholder: "Password")
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color("Light"))
    }
}
