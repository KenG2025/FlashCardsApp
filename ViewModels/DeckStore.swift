//
//  CeckStore.swift
//  FlashCardsApp
//
//  Created by Ken Gonzalez on 1/6/26.
//

import Foundation
import SwiftUI
import Combine


@MainActor
final class DeckStore: ObservableObject {
    var objectWillChange: ObservableObjectPublisher
    
    @Published var decks: [Deck] = [] {
        didSet { save() } // auto-save any changes
    }

    private let store = FileStore(fileName: "decks.json")

    init() {
        load()
        if decks.isEmpty {
            decks = Self.sampleDecks
        }
    }

    // MARK: - CRUD (basic)

    func deleteCard(in deckID: UUID, at offsets: IndexSet) {
        guard let i = decks.firstIndex(where: { $0.id == deckID }) else { return }
        decks[i].cards.remove(atOffsets: offsets)
    }
    
    
    func addCard(to deckID: UUID, front: String, back: String) {
        guard let i = decks.firstIndex(where: { $0.id == deckID }) else { return }
        decks[i].cards.append(Flashcard(front: front, back: back))
    }

    func deck(for deckID: UUID) -> Deck? {
        decks.first(where: { $0.id == deckID })
    }

    func addDeck(name: String) {
        let newDeck = Deck(name: name, cards: [])
        decks.append(newDeck)
    }

    func deleteDeck(at offsets: IndexSet) {
        decks.remove(atOffsets: offsets)
    }

   

    // MARK: - Persistence

    private func load() {
        do {
            decks = try store.load([Deck].self)
        } catch {
            decks = []
        }
    }

    private func save() {
        do {
            try store.save(decks)
        } catch {
            // In a beginner class we can ignore or print
            print("Save error:", error)
        }
    }

    // MARK: - Sample Data

    static let sampleDecks: [Deck] = [
        Deck(name: "Swift Basics", cards: [
            Flashcard(front: "var vs let", back: "let is constant, var is mutable"),
            Flashcard(front: "Optional", back: "A value that can be nil")
        ]),
        Deck(name: "Spanish", cards: [
            Flashcard(front: "Hola", back: "Hello"),
            Flashcard(front: "Gracias", back: "Thank you")
        ])
    ]
}
