//
//  Main.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 24.11.2023.
//

import SwiftUI


struct JobItem: Identifiable {
    let id = UUID()
    let title: String
    let county: String
    let city: String
    let company: String
    var likes: Int // New property for likes
    var shares: Int // New property for shares

    
}

struct MockJobs {
    static var items = [
        JobItem(title: "Juristisches Praktikum", county: "Zürich", city: "Zürich", company: "Rechtsabteilung AG", likes: 15, shares: 5),
        JobItem(title: "Softwareentwickler Praktikum", county: "Luzern", city: "Luzern", company: "TechSoft GmbH", likes: 25, shares: 8),
        JobItem(title: "Marketing Manager", county: "Bern", city: "Bern", company: "Swiss Marketing Solutions", likes: 20, shares: 10),
        JobItem(title: "Finanzanalyst", county: "Genf", city: "Genf", company: "FinanceXpert SA", likes: 18, shares: 7),
        JobItem(title: "Produktdesigner", county: "Basel-Landschaft", city: "Pratteln", company: "Innovative Designs AG", likes: 30, shares: 12),
        JobItem(title: "Personalassistent", county: "Waadt", city: "Lausanne", company: "HR Connect", likes: 22, shares: 6),
        JobItem(title: "Datenwissenschaftler", county: "Aargau", city: "Aarau", company: "DataIntel GmbH", likes: 28, shares: 9),
        JobItem(title: "Verkaufsleiter", county: "St. Gallen", city: "St. Gallen", company: "SalesPro AG", likes: 35, shares: 15),
        JobItem(title: "Grafikdesigner", county: "Thurgau", city: "Frauenfeld", company: "ArtWorks AG", likes: 16, shares: 3),
        JobItem(title: "Betriebskoordinator", county: "Schwyz", city: "Schwyz", company: "Global Operations GmbH", likes: 12, shares: 4)
        
    ]
}

struct MainView: View {
    
    @ObservedObject var avm : AppViewModel

    let elementsPerSlide = 1 // Number of elements per slide
    let totalElements = 10 // Total elements
    

 
  
    

    
    
    var body: some View {
        
            VStack {
                NavigationView{
                ScrollView {
                    
                    VStack {
                        
                        HStack {
                            ThemeButton(
                                icon: "plus",
                                type: .menuIcon ,
                                action: {
                                    
                                    avm.settings.isMenuOpen.toggle()
                                    print(avm.settings.isMenuOpen)
                                }
                            )
                            
                            Spacer()
                            
                            
                            Avatar(name: avm.user.avatar ?? avm.user.name, size: 45)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        HStack {
                            Fields(icon: "", type: .textfield, placeholder: "Stelle suchen...", isSecureField: false, keyboardType: .default, text: .constant(""))
                            
                            ThemeButton(
                                icon: "plus",
                                type: .filterIcon ,
                                action: {
                                    print("Button tapped plus")
                                }
                            )
                        }
                        
                    } .padding(.horizontal).padding(.vertical,32)
                    
                    
                    VStack {
                        
                        HStack {
                            Text("Beliebte Stellen")
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(Color.gray)
                            Spacer()
                            
                            Text("Alle Anzeigen")
                                .font(.caption)
                                .fontWeight(.light)
                                .foregroundColor(Color.gray).opacity(0.85)
                        } .padding(.horizontal)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(MockJobs.items) { item in
                                    JobCards(
                                        type: .popular,
                                        icon: "pencil",
                                        title: item.title,
                                        county: item.county,
                                        city: item.city,
                                        company: item.company,
                                        share: { print("share tapped") },
                                        favorite: { print("isFavorite tapped") }
                                        
                                    )
                                    .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 8.0)
                                    .fixedSize() // Ensure the JobCards have a fixed size
                                }
                            } .scrollTargetLayout()
                        }
                        
                        
                        
                        
                        
                        .safeAreaPadding(.horizontal,0)
                        .contentMargins(.horizontal, 16, for: .scrollContent)
                        .scrollTargetBehavior(.viewAligned)
                        
                        
                        
                    }
                    
                    
                    
                    VStack {
                        HStack {
                            Text("Neuste Stellen")
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(Color.gray)
                            Spacer()
                            
                            Text("Alle Anzeigen")
                                .font(.caption)
                                .fontWeight(.light)
                                .foregroundColor(Color.gray).opacity(0.85)
                        }
                        
                        
                        ForEach(MockJobs.items) { item in
                            JobCards(
                                type: .popular,
                                icon: "pencil",
                                title: item.title,
                                county: item.county,
                                city: item.city,
                                company: item.company,
                                share: { print("share tapped") },
                                favorite: { print("isFavorite tapped") }
                                
                            )
                            
                        }
                        
                        
                     
                        
                        
                    }  .padding(.horizontal) .padding(.vertical,32)
                    
                   
                    
                   
                    
                    
                    
                }
                
               
                
                
        
                                
                                
                            
                
                .background(Color("Light"))
                
            } 

            
            
            
            
          
            
        }
    }
}

#Preview {
    MainView(
        avm: AppViewModel()
        
    )
}
