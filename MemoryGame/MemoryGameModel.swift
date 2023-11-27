import SwiftUI

struct Card<CardContent> : Identifiable where CardContent: Equatable {
    var id: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var content: CardContent
}

struct MemoryGameModel<CardContent> where CardContent: Equatable{
    var cards: [Card<CardContent>] = Array()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCards = cards.indices.filter{ index in cards[index].isFaceUp }
            if faceUpCards.count == 1 {
                return faceUpCards.first
            }
            else {
                return nil
            }
        }
        set{
            cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0) }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        for i in 0..<max(numberOfPairsOfCards, 2) {
            cards.append(Card(id:"\(i * 2)", content:cardContentFactory(i)))
            cards.append(Card(id:"\(i * 2 + 1)", content:cardContentFactory(i)))
        }
        shuffle()
    }
    
    mutating func chooseCard(card: Card<CardContent>) {
        guard let chosenCardIndex = cards.firstIndex(where: {$0.id == card.id}) else {
            return
        }
        guard let faceUpCardIndex = indexOfOneAndOnlyFaceUpCard else {
            indexOfOneAndOnlyFaceUpCard = chosenCardIndex
            return
        }
        if faceUpCardIndex == chosenCardIndex {
            return
        }
        
        if cards[faceUpCardIndex].content == cards[chosenCardIndex].content {
            cards[faceUpCardIndex].isMatched = true
            cards[chosenCardIndex].isMatched = true
        }
        indexOfOneAndOnlyFaceUpCard = nil
    }
    
    mutating func shuffle() {
        cards.shuffle()
        cards.indices.forEach{
            cards[$0].isFaceUp = false
            cards[$0].isMatched = false
        }
    }
    
}
