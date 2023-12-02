//
//  RootView.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 27.11.2023.
//

//
//  HomeView.swift
//  Created by Abdullah Kardas on 20.08.2022.
//

import SwiftUI
import SideMenu

struct RootView: View {
    @ObservedObject var avm : AppViewModel
    @State var isMenuOpen:Bool = true
    let tabs = [
        MenuTabModel(title: "Profil bearbeiten", imageName: "house.fill", individuaLinkColor: .red),
        MenuTabModel(title: "Bewerbungen (0)", imageName: "star.fill", individuaLinkColor: .red),
        MenuTabModel(title: "Benachrichtigungen", imageName: "megaphone.fill", individuaLinkColor: .red),
        MenuTabModel(title: "App teilen", imageName: "square.and.arrow.up.fill", individuaLinkColor: .red)
       
    ]

    @State var selectedTab:MenuTabModel = MenuTabModel(title: "Home", imageName: "house", individuaLinkColor: .red)
    @State var backColor = Color("PrimaryThemeColor")
    
    
    var body: some View {
        ZStack {
            
             
            
            SideMenuView(
                offset: 0.95,
                isIndividualLinkColor: false,
                isMenuOpen: $avm.settings.isMenuOpen,
                tabs: tabs, // add your [MenuTabModel]
                selectedTab: $selectedTab, //initial selectedTab
                backColor: $backColor,     //acces view placeholder background
                backImage: "menuBG", avatar: nil,     //add your backgro und image! Default value is airplane
                overlay: 0.5,
                blurRadius: 32,            // add blur radius for image default value is 32
                selectedMenuView: .roundIcons,
                content:
                    {
                        switch selectedTab.title {
                        case "Home":
                            MainView(avm: avm)
                        default:
                            EmptyView()
                        }
                    }
                
            )
            
            
             
            
            
            
            }
        }

    }




struct TabOne: View {
    @Binding var isMenuOpen:Bool
    @Binding var backColor:Color
    @ObservedObject var avm : AppViewModel
    var body: some View {
        ZStack {//Your content is here
            MainView(avm: avm)
        }.onAppear{
            backColor = Color("Light")
        }
        .padding(.top,60)
        .cornerRadius(isMenuOpen ? 12:0)
    }
}





struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        
        @ObservedObject var avm = AppViewModel()
        return RootView(avm: avm)
        
    }
}
