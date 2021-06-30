//
//  EmojiMemoryGamePresenter.swift
//  Memorize
//
//  Created by 🤨 on 8/06/21.
//

import SwiftUI

class EmojiMemoryGamePresenter: ObservableObject {
  typealias Card = MemoryGameInteractor<String>.Card
  
  private static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "✈️", "🛫", "🛬", "🛩", "🚀", "🛸", "🚁", "🛶", "⛵️", "🚤", "⛷", "🏂", "🪂", "🏋🏻‍♀️"]
  
  private static func createMemoryGame() -> MemoryGameInteractor<String> {
    MemoryGameInteractor<String>(numberOfPairsOfCards: 6) { pairIndex in
      EmojiMemoryGamePresenter.emojis[pairIndex]
    }
  }
  
  @Published private var model = createMemoryGame()
  
  var cards: Array<Card> {
    model.cards
  }
  
  // MARK: - Intent(s)
  
  func choose(_ card: Card) {
    model.choose(card)
  }
}
