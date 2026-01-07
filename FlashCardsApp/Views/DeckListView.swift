//
//  DeckListView.swift
//  FlashCardsApp
//
//  Created by Ken Gonzalez on 1/6/26.
//

import SwiftUI

struct DeckListView: View {
    @EnvironmentObject var store: DeckStore

    var body: some View {
        List {
            Section("Decks") {
                ForEach(store.decks) { deck in
                    NavigationLink {
                        StudyView(deck: deck)
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(deck.name).font(.headline)
                            Text("\(deck.cards.count) cards")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle("Flashcards")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    SettingsView()
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
    }
}
