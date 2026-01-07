//
//  FlashCardsAppApp.swift
//  FlashCardsApp
//
//  Created by Ken Gonzalez on 1/6/26.
//

import SwiftUI
import SwiftData

@main
struct FlashCardsAppApp: App {
    
    @StateObject private var store = DeckStore()
    @State var isDarkMode:Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                DeckListView()
            }
            .environmentObject(store)

            
        }
        
    }
    
    
}


