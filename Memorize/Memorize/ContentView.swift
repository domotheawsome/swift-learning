//
//  ContentView.swift
//  Memorize
//
//  Created by Meshorer, Ariel (604555397) on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false // defualt Vlaue
    
    var body: some View {
        ZStack {
            if isFaceUp {
                // Z vs H vs V
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                // something that behaves like a shape
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    // styles perfolate all the way down, orange is the default from hstack and it goes all the way down to cardview. because the background isn't specified, it gets the background color from above.
               
            }
        }
    }
}

#Preview {
    ContentView()
}
