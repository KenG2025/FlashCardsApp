//
//  FlashCardModel.swift
//  FlashCardsApp
//
//  Created by Ken Gonzalez on 1/6/26.
//
import Foundation


struct Flashcard: Identifiable, Codable{
    let id = UUID()
    var front: String
    var back: String
    
    init(front: String, back: String) {
        self.front = front
        self.back = back
    }
}
