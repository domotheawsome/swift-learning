//
//  ContentView.swift
//  Memorize
//
//  Created by Meshorer, Ariel (604555397) on 10/17/24.
//

import SwiftUI

struct EmojiTheme {
    let name: String
    let symbol: String
    let array: [String]
    let cardColor: Color
    
    static let allThemes: [EmojiTheme] = [
        EmojiTheme(name: "Halloween", symbol: "wand.and.stars", array: ["🎃", "🎃", "👻", "👻", "🍫", "🍫", "🍂", "🍂"], cardColor: .orange),
        EmojiTheme(name: "Christmas", symbol: "tree", array: ["🎄", "🎄", "🎁", "🎁", "☃️", "☃️", "🎅", "🎅"], cardColor: .red),
        EmojiTheme(name: "Pink", symbol: "heart.fill", array: ["🌷", "🌷", "🎀", "🎀", "👙", "👙", "💖", "💖"], cardColor:  Color(red: 255/255, green: 105/255, blue: 180/255))
]
}

struct ThemeButton: View {
    let action: () -> Void
    var imageName: String
    var text: String
    
    var body: some View {
        Button(action: action) {
            VStack{
                Spacer()
                Image(systemName: imageName)
                    .font(.largeTitle)
                Spacer()
                Text(text)
                    .font(.title3)
                    .padding(.top, 4)
            }
            .frame(width: 100, height: 75)
            .padding(.vertical, 8)
            //.padding(.horizontal, 16)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
        }
    }
}

struct ContentView: View {
    
    @State private var currentTheme: EmojiTheme = EmojiTheme.allThemes[0]
    @State var cardCount: Int = 8
    var body: some View {
        
        VStack {
            ScrollView {
                Text("Memorize!").font(.largeTitle)
                cards(emojiArray: currentTheme)
                Spacer()
                themeShuffle
            }
        }
        .imageScale(.small)
        .padding()
    }
    
    
    
    
    func cards(emojiArray: EmojiTheme) -> some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<min(cardCount,emojiArray.array.count), id: \.self) { index in
                CardView(content: emojiArray.array[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(emojiArray.cardColor)
    }
    

    
    var themeShuffle: some View {
        HStack {
            themeShuffler(for: EmojiTheme.allThemes[0])
            Spacer()
            themeShuffler(for: EmojiTheme.allThemes[1])
            Spacer()
            themeShuffler(for: EmojiTheme.allThemes[2])

        }
    }
    
    func themeShuffler(for theme: EmojiTheme) -> some View {
        ThemeButton(action: {
            currentTheme = EmojiTheme(name: theme.name, symbol: theme.symbol, array: theme.array.shuffled(), cardColor: theme.cardColor)
            cardCount = min(cardCount, theme.array.count)
        }, imageName: theme.symbol, text: theme.name)
    }

}
    
   

struct CardView: View {
    let content: String
    // can't be changed
    @State var isFaceUp = false // defualt Vlaue
    // way to declare state in swift
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.system(size: 60))
                
            } 
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)

            
               
        }.onTapGesture {
            print("tapped")
            // prints to the preview
            // very convienent
            
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
