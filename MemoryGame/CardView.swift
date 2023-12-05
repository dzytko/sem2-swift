import SwiftUI

struct CardView: View {
    var card: Card<String>
    var color: Color
    
    var body2: some View {
        TimelineView(.animation) { timeline in
            if card.isFaceUp || !card.isMatched {
                CirclePart(endAngle: .degrees(card.bonusRemaining * 360))
                    .opacity(0.5)
                    .overlay(cardContents.padding(5))
                    .padding(5)
                    .transformIntoCard(isFaceUp: card.isFaceUp)
                    .transition(.scale)
            }
            else {
                Color.clear
            }
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
            Text(card.content).font(.largeTitle)
            RoundedRectangle(cornerRadius: 12)
                .fill(color).opacity(card.isFaceUp ? 0 : 1)
            
        }.foregroundColor(color).opacity(card.isMatched ? 0 : 1)
    }
    
    var cardContents: some View {
        Text(card.content)
            .font(.largeTitle)
            .aspectRatio(1, contentMode: .fill)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: card.isMatched)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: "aaaaa", content: "a"), color: .blue)
    }
}
