import SwiftUI

struct CardView: View {
    var card: Card<String>
    var color: Color
    
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
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: "aaaaa", content: "a"), color: .blue)
    }
}
