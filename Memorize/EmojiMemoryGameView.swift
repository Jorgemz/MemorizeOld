//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by 🤨 on 4/06/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGamePresenter
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3,  content: { card in
            cardView(for: card)
        })
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGamePresenter.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
    }
}

struct CardView: View {
  let card: EmojiMemoryGamePresenter.Card
  
  var body: some View {
    GeometryReader { geometry in
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
          if card.isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            Pie(starAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                .padding(5).opacity(0.5)
            Text(card.content)
                .font(font(in: geometry.size))
          }
          else if card.isMatched {
            shape.opacity(0)
          }
          else {
            shape.fill()
          }
        }
    }
  }
  
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
}





























struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGamePresenter()
    game.choose(game.cards.first!)
    return EmojiMemoryGameView(game: game)
//      .preferredColorScheme(.dark)
//    EmojiMemoryGameView(game: game)
//      .preferredColorScheme(.light)
  }
}
