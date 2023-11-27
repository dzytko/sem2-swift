import SwiftUI

struct Theme : Identifiable {
    var id: Int
    var name: String
    var color: Color
    var cardsContent: [String]
    var icon: String
}

class MemoryGameViewModel: ObservableObject {
    static var themes = [
        Theme(id: 0, name: "Theme 1", color: .blue, cardsContent: ["a", "b", "c"], icon: "smiley"),
        Theme(id: 1, name: "Theme 2", color: .red, cardsContent: ["d", "e", "f"], icon: "smiley"),
        Theme(id: 2, name: "Theme 3", color: .green, cardsContent: ["g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q"], icon: "smiley")
    ]
    static var defaultTheme: Theme {
        return themes[0]
    }
    
    private static func createGameModel(theme: Theme) -> MemoryGameModel<String> {
        return MemoryGameModel<String>(numberOfPairsOfCards: theme.cardsContent.count, cardContentFactory: {
            index in
            if theme.cardsContent.indices.contains(index) {
                return theme.cardsContent[index]
            }
            else {
                return "?"
            }
        })
    }
    
    var selectedTheme = defaultTheme
    @Published private var gameModel = createGameModel(theme: defaultTheme)
    
    var cards: Array<Card<String>> {
        return gameModel.cards
    }
    
    func changeTheme(themeId: Int) {
        if let theme = MemoryGameViewModel.themes.first(where: {$0.id == themeId}) {
            selectedTheme = theme
        }
        else {
            selectedTheme = MemoryGameViewModel.defaultTheme
        }
        
        gameModel = MemoryGameViewModel.createGameModel(theme: selectedTheme)
    }
    
    func chooseCard(card: Card<String>) {
        gameModel.chooseCard(card: card)
    }
    
    func shuffle() {
        gameModel.shuffle()
    }
}
