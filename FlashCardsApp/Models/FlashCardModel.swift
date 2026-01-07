//
//  FlashCardModel.swift
//  FlashCardsApp
//
//  Created by Ken Gonzalez on 1/6/26.
//
import Foundation

struct Deck: Identifiable{
    let id = UUID()
    var name: String
    var cards: [Flashcard]
}

struct Flashcard: Identifiable{
    let id = UUID()
    var front: String
    var back: String
}
