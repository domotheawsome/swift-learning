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
    @State var isFaceUp = false // defualt Vlaue
    // way to declare state in swift
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            // let means its a constant
            // var means its a variable/it varies
            // inside a viewbuilder (zstack) you always use let because it never changes
            // type inference = becuase you assigned the let to a rounded rectangle, it will infer that you want it to be a rounded rectangle
            // we always let swift infer rather than explicity typing it ourselves
            // swift is a strongly typed language
                // it knows all the types at compile time
                // very strongly typed language are annoying if you have to be constantly be expressing types
                // the tradeoff is that it does enormous type inference for being a strongly typed language
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            
            } else {
                RoundedRectangle(cornerRadius: 12)
                    // styles perfolate all the way down, orange is the default from hstack and it goes all the way down to cardview. because the background isn't specified, it gets the background color from above.
               
            }
               
        }.onTapGesture {
            print("tapped")
            // prints to the preview
            // very convienent
            
            isFaceUp.toggle() // this will flip the card
            // views are immutable -- self is immutable
            
            // backend is what will flip cards over, you cannot do it on the view
            // toggle is a better way to flip cards
        }
    }
}

#Preview {
    ContentView()
}
