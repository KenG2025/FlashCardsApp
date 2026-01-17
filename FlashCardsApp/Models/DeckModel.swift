//
//  DeckModel.swift
//  FlashCardsApp
//
//  Created by Ken Gonzalez on 1/16/26.
//

import Foundation

struct Deck: Identifiable, Codable{
    let id = UUID()
    var name: String
    var cards: [Flashcard]
    
    init(name: String, cards: [Flashcard]) {
        self.name = name
        self.cards = cards
    }
}
