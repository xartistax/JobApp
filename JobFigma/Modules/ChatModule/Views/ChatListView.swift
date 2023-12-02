//
//  ChatListView.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 25.11.2023.
//

import SwiftUI
import Awesome
import SwipeActions
import Combine


struct ChatItem: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let avatar: String
    let count: Int // New property for shares
    let timeStamp: Int

    
}


struct MockChats {
    static var items = [

   
        ChatItem(title: "Hannah Schmidt", text: "Hallo! Wir haben eine neue Position bei XYZ GmbH. Ich denke, du wärst perfekt dafür. Soll ich dir mehr Informationen schicken?", avatar: "Hanna.jpeg", count: 2, timeStamp: 1663350900),
            ChatItem(title: "Lukas Müller", text: "Ich habe ein interessantes Stellenangebot bei einem aufstrebenden Start-up. Soll ich deine Unterlagen weiterleiten?", avatar: "Lukas.jpeg", count: 5, timeStamp: 1663274500),
            ChatItem(title: "Sophie Wagner", text: "Hallo! Wie läuft deine Jobsuche? Ich habe einige Tipps, die dir helfen könnten, deine Chancen zu verbessern.", avatar: "Sophie.jpeg", count: 1, timeStamp: 1663274500),
            ChatItem(title: "Finn Becker", text: "Erinnerst du dich an die offene Position bei ABC AG? Dein Profil hat großes Potenzial. Sollen wir über eine Bewerbung sprechen?", avatar: "Finn.jpeg", count: 0, timeStamp: 1663101700),
            ChatItem(title: "Emilia Richter", text: "Hallo! Eine neue Stelle als Projektmanager wurde gerade eröffnet. Ich denke, es könnte gut zu deinem Profil passen.", avatar: "Emilia.jpeg", count: 7, timeStamp: 1662965700),
            ChatItem(title: "Jonas Schmitz", text: "Ich habe einige tolle Jobaussichten für dich. Wann hast du Zeit für ein kurzes Gespräch über deine Karriereziele?", avatar: "Jonas.jpeg", count: 3, timeStamp: 1662879300),
            ChatItem(title: "Lea Krüger", text: "Ich habe einige großartige Jobtipps, die ich gerne mit dir teilen würde. Lass uns über deine Bewerbungsstrategie sprechen.", avatar: "Lea.jpeg", count: 10, timeStamp: 1662792900),
            ChatItem(title: "Tim Berger", text: "Hallo! Ich arbeite gerade an einer offenen Position für einen Softwareentwickler. Interessiert?", avatar: "Tim.jpeg", count: 4, timeStamp: 1662706500),
            ChatItem(title: "Clara Schäfer", text: "Hallo! Wie läuft deine Suche nach neuen Karrieremöglichkeiten? Ich könnte dir bei der Positionssuche helfen.", avatar: "Clara.jpeg", count: 6, timeStamp: 1662620100),
            ChatItem(title: "Maximilian Huber", text: "Die Stelle für den Marketing Manager ist immer noch offen. Bist du bereit für eine neue Herausforderung?", avatar: "Maximilian.jpeg", count: 0, timeStamp: 1662533700)
        ]

        

        
    
}

struct ChatListView: View {
    
    // Sort the items by timestamp
    let sortedChats = MockChats.items.sorted(by: { $0.timeStamp < $1.timeStamp })
    
    
    var body: some View {
        NavigationView{
            VStack {

                ScrollView {
                    
                    VStack{
                        ForEach(sortedChats) { item in
                            
                            
                            SwipeView {
                                ChatListElement(name: item.title, text: item.text, avatar: item.avatar, count: item.count)
                            } leadingActions: { _ in
                            } trailingActions: { _ in
                                
                                SwipeAction(systemImage: "archivebox") {
                                    print("Tapped!")
                                }
                                .background(Color("PrimaryThemeColor"))
                                .foregroundColor(Color.white)
                                
                                SwipeAction(systemImage: "trash") {
                                    print("Tapped!")
                                }
                                .background(Color.red)
                                .foregroundColor(Color.white)
                                
                                
                                
                            }
                            .swipeActionsStyle(.mask) /// Modifiers for `SwipeView` go here.
                            .swipeActionsMaskCornerRadius(0)
                            .swipeActionCornerRadius(0)
                            .swipeSpacing(0)
                   
                          
                                
                                
                        }
                    }
                    .padding(.horizontal)
                    
                    
                }
            }
            .toolbar {
                      
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "archivebox")
                                    .foregroundColor(.primary)
                            })
                        }
                
                ToolbarItem(placement: .principal) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Nachrichten")
                            .font(.headline)
                            .foregroundColor(.primary)
                    })
                }
                    }
            .frame(maxWidth: .infinity)
            .background(Color("Light"))
        }
        
        

    }
}

#Preview {
    ChatListView()
}
