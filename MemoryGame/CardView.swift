import SwiftUI

struct CardView: View {
    var isFaceUp: Bool
    var content: String
    var cardColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
            Text(content).font(.largeTitle)
            RoundedRectangle(cornerRadius: 12)
                .fill(cardColor).opacity(isFaceUp ? 0 : 1)
            
        }.foregroundColor(cardColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(isFaceUp: false, content: "a", cardColor: .blue)
    }
}
