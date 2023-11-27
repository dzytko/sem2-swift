import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MemoryGameViewModel()
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            ScrollView { cardDisplay }.padding()
            Button(action: viewModel.shuffle) {
                Text("Shuffle")
            }
            themeButtons
        }
        .padding()
    }
    
    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(isFaceUp: card.isFaceUp, content: card.content, cardColor: viewModel.selectedTheme.color)
                    .aspectRatio(2 / 3, contentMode: .fill)
                    .padding(4)
                    .onTapGesture {viewModel.chooseCard(card: card)}
            }
        }.foregroundColor(viewModel.selectedTheme.color)
    }
    
    var themeButtons: some View {
        HStack {
            ForEach(MemoryGameViewModel.themes) { theme in
                ThemeButton(
                    themeIcon: theme.icon,
                    themeName: theme.name,
                    themeColor: theme.color,
                    onClickAction: {viewModel.changeTheme(themeId: theme.id)}
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
