//
//  JobCards.swift
//  JobFigma
//
//  Created by Demian Füglistaler on 23.11.2023.
//

import SwiftUI


enum CardType {
    case popular
    case list
}

struct JobCards: View {
    
    
    var type: CardType
    var icon: String
    var title : String
    var county : String
    var city : String
    var company : String?
    var share: () -> Void
    var favorite: () -> Void
    
    
    
    var body: some View {
        
        VStack {
            
            switch type {
                case .popular:
                    VStack {
                        VStack {
                            HStack {
                                
                                
                                VStack {
                                    Image(systemName: icon)
                                }
                                .padding(8)
                                .background(Color("PrimaryThemeColor"))
                                .foregroundColor(.white)
                                .cornerRadius(4)
                                
                                Text(company ?? "")
                                    .font(.caption)
                                    .opacity(0.5)
                                
                                
                                Spacer()
                                
                                
                                Button(action: {
                                    print("shared tapped")
                                }) {
                                    Image(systemName: "square.and.arrow.up.fill").foregroundColor(Color(UIColor.placeholderText))
                                }
                                
                                
                                Button(action: {
                                    print("fav tapped")
                                }) {
                                    Image(systemName: "heart.fill").foregroundColor(Color(UIColor.placeholderText))
                                }
                            
                        
                        
                                
                               
                            }
                        }
                        
                        VStack {
                            HStack {
                                Text(title)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(.top, 6)
                                    .padding(.bottom, 1)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("\(county), \(city)")
                                    .font(.system(size: 12))
                                    .opacity(0.5)
                                    
                                Spacer()
                            }
                            
                            
                        }
                    }
                    .padding(.vertical, 32)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 15, x: 3, y: 6)
               
                case .list:
                    VStack {
                        HStack {
                            VStack {
                                Image(systemName: icon)
                            }
                            .padding(8)
                            .background(Color("PrimaryThemeColor"))
                            .foregroundColor(.white)
                            .cornerRadius(4)
                            .padding(.trailing,8)
                            
                            VStack {
                                VStack {
                                    HStack {
                                        Text(title)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 1)
                                        
                                        Spacer()
                                    }
                                }
                                VStack (alignment:.leading) {
                                    HStack {
                                        Text("\(county), \(city)")
                                            .font(.system(size: 12))
                                            .opacity(0.5)
                                        
                                        Spacer()
                                    }
                                  
                                }
                            }
                            
                            
                            Spacer()
                            
              
                                
                            Button(action: {
                               share()
                            }) {
                                Image(systemName: "square.and.arrow.up.fill").foregroundColor(Color(UIColor.placeholderText))
                            }
                            
                            
                            Button(action: {
                                favorite()
                            }) {
                                Image(systemName: "heart.fill").foregroundColor(Color(UIColor.placeholderText))
                            }
                            
                        }
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 15, x: 3, y: 6)
            }
            
            
            
            
            
        } 
    }
}

#Preview {
    Group {
        VStack {
            JobCards(
                type: .popular,
                icon: "pencil",
                title: "Lead Product Manager",
                county: "Zürich",
                city: "Schlieren",
                company: "Swisscom AG",
                share: { print("share tapped") },
                favorite: { print("isFavorite tapped") } )
            
            JobCards(
                type: .list,
                icon: "pencil",
                title: "Lead Product Manager",
                county: "Zürich",
                city: "Schlieren",
                company: "Swisscom AG",
                share: { print("share tapped") },
                favorite: { print("isFavorite tapped") } )
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Light"))
    }
    
}
