//
//  TestView.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 27.11.2023.
//

import SwiftUI

struct TestView: View {
    
    @Binding var isMenuOpen:Bool
    @Binding var backColor:Color
    @ObservedObject var avm : AppViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TestView(isMenuOpen: .constant(true), backColor: .constant(Color.red), avm: AppViewModel())
}
