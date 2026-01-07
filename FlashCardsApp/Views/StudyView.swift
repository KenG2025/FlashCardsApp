//
//  StudyView.swift
//  FlashCardsApp
//
//  Created by Ken Gonzalez on 1/6/26.
//

import SwiftUI

struct StudyView: View {
    let deck: Deck

    // read preferences from UserDefaults
    @AppStorage("shuffleCards") private var shuffleCards: Bool = true
    @AppStorage("cardsPerSession") private var cardsPerSession: Int = 10
    @AppStorage("showBackFirst") private var showBackFirst: Bool = false
    
    
    @State private var index: Int = 0
    @State private var isFlipped: Bool = false
    @State private var sessionCards: [Flashcard] = []

    var body: some View {
        VStack(spacing: 20) {
            if sessionCards.isEmpty {
                Text("No cards in this deck.")
                    .foregroundStyle(.secondary)
            } else {
                Text("\(index + 1) / \(sessionCards.count)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.thinMaterial)
                        .frame(height: 220)

                    Text(currentText)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .onTapGesture {
                    isFlipped.toggle()
                }

                HStack(spacing: 16) {
                    Button("Prev") { prev() }
                        .buttonStyle(.bordered)
                        .disabled(index == 0)

                    Button(isFlipped ? "Show Front" : "Show Back") {
                        isFlipped.toggle()
                    }
                    .buttonStyle(.borderedProminent)

                    Button("Next") { next() }
                        .buttonStyle(.bordered)
                        .disabled(index == sessionCards.count - 1)
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle(deck.name)
        .onAppear {
            startSession()
        }
    }

    private var currentText: String {
        guard !sessionCards.isEmpty else { return "" }
        let card = sessionCards[index]

        // If showBackFirst is true, flip logic starts reversed
        let showingFront = showBackFirst ? isFlipped : !isFlipped
        return showingFront ? card.front : card.back
    }

    private func startSession() {
        var cards = deck.cards
        if shuffleCards { cards.shuffle() }
        let limit = min(cardsPerSession, cards.count)
        sessionCards = Array(cards.prefix(limit))
        index = 0
        isFlipped = false
    }

    private func next() {
        if index < sessionCards.count - 1 {
            index += 1
            isFlipped = false
        }
    }

    private func prev() {
        if index > 0 {
            index -= 1
            isFlipped = false
        }
    }
}
