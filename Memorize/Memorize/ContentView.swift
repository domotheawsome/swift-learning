//
//  ContentView.swift
//  Memorize
//
//  Created by Meshorer, Ariel (604555397) on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "😍", "👻", "😍"]
    // array is array type
    // <string> is whats in the array
        // we can also make our own generic type
    // the = [] is an array literal
    // you can also scope the array wherever
    // let emojis: [String] is the synonymous to Array<String>
    var body: some View {
        
        // the way you do the for loop is via a view, you can't do a forloop becuase you cannot mutate the view.
        
        // you use the for each view
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                // range 0->up to and not including 4, 0..<4
                // viewbuilder that has an argrumnet, tkae the index argument
                // .indicies gives you the length and thus gives you the range
            }
                
            
        }
        
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
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
                Text(content).font(.largeTitle)
            
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
