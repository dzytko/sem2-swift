import SwiftUI

struct Card<CardContent> : Identifiable where CardContent: Equatable {
    var id: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var content: CardContent
}

struct MemoryGameModel<CardContent> where CardContent: Equatable{
    var cards: [Card<CardContent>] = Array()
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        for i in 0..<max(numberOfPairsOfCards, 2) {
            cards.append(Card(id:"\(i * 2)", content:cardContentFactory(i)))
            cards.append(Card(id:"\(i * 2 + 1)", content:cardContentFactory(i)))
        }
        shuffle()
    }
    
    mutating func chooseCard(card: Card<CardContent>) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
}
