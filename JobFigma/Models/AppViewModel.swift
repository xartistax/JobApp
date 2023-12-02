//
//  AppViewModel.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 24.11.2023.
//

import Foundation


struct User {
    var name: String
    var avatar: String?
    
}

struct UserSettings {
    var notificationNewMessage: Bool
    var notificationBewerbungAbgelehnt: Bool
    var notificationDarkMode: Bool
    var isMenuOpen: Bool

}

class AppViewModel: ObservableObject {
    
    @Published var selectedView: ViewOption
    @Published var user: User
    @Published var settings: UserSettings
    
    
    init() {
        self.selectedView = .mainView
        self.user = User(
            name: "Mike Müller",
            avatar: "Avatar"
        )
        self.settings = UserSettings(
            notificationNewMessage: true,
            notificationBewerbungAbgelehnt: true,
            notificationDarkMode: false,
            isMenuOpen: false // Set isMenuOpen directly here
        )
    }
}
