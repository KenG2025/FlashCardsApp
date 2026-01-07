//
//  SettingsView.swift
//  FlashCardsApp
//
//  Created by Ken Gonzalez on 1/6/26.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("shuffleCards") private var shuffleCards:Bool = true
    @AppStorage("showBackFirst") private var showBackFirst:Bool = false
    @AppStorage("cardPerSession") private var cardsPerSession:Int = 10
    @AppStorage("darkMode") private var isDarkMode:Bool = false
    
    
    
    var body: some View {
        Form{
            Section("Study"){
                Toggle("Shuffle cards", isOn:$shuffleCards)
                Toggle("Show back first", isOn:$showBackFirst)
                
                Stepper("Cards pper session: \(cardsPerSession)", value: $cardsPerSession)
            }
            
            Section("About"){
                Text("These settings persist using UserDefault View @AppStorage")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Section("Appearance"){
                
                Toggle("Dark mode", isOn: $isDarkMode)
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}


#Preview {
    SettingsView()
        
}
