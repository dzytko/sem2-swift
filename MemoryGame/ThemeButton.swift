import SwiftUI

struct ThemeButton: View {
    var themeIcon: String
    var themeName: String
    var themeColor: Color
    var onClickAction: () -> Void
    
    var body: some View {
        VStack {
            Button(action: onClickAction) {
                VStack {
                    Image(systemName: themeIcon)
                    Text(themeName).font(.footnote)
                }
            }
        }.padding().foregroundColor(themeColor)
    }
}
