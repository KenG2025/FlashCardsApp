//
//  CeckStore.swift
//  FlashCardsApp
//
//  Created by Ken Gonzalez on 1/6/26.
//

import Foundation
import Combine

final class DeckStore: ObservableObject{
    @Published var decks: [Deck] = [
        Deck(name: "Spanish", cards: [Flashcard(front: "Hola", back: "Hello"),
                                      Flashcard(front: "Gracias", back: "Thank You")]
            ),
        Deck(name: "Swift Course", cards: [
            Flashcard(front: "var vs let", back: "let is constant, var is mutable"),
            Flashcard(front: "Optional", back: "A value that can be nil")
        ])
    ]
}
