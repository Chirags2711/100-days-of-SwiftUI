//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Chirag Sharma on 10/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.red)
//        
//        
        
        
//        Button("Hello, world!") {
//            print(type(of: self.body))
//        }
//        .background(.red)
//        .frame(width: 200, height: 200)
        //ModifiedContent<ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>>, _FrameLayout>
        //This is why modifier order matters
        //SwiftUI renders the view after every single modifier
        //the way modifiers work: each one creates a new struct with that modifier applied, rather than just setting a property on the view.
        
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
        .padding(20)
        .background(.blue)
        //ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Button<Text>, _FrameLayout>, _BackgroundStyleModifier<Color>>, _PaddingLayout>, _BackgroundStyleModifier<Color>>
        //We can return above, or simply, "some View"
        //some: I will send some view, but I don't want to tell exactly what view. Swift compiler knows internally.
        
//        Text("Hello, world!")
//            .padding()
//            .background(.red)
//            .padding()
//            .background(.blue)
//            .padding()
//            .background(.green)
//            .padding()
//            .background(.yellow )
        
        
        
        //Returning View makes no sense, because Swift wants to know what’s inside the view – it has a big hole that must be filled. On the other hand, returning Text is fine, because we’ve filled the hole; Swift knows what the view is.
        
        
        
        
        
        //There are two places where it gets a bit more complicated:
        
//        How does VStack work – it conforms to the View protocol, but how does it fill the “what kind of content does it have?” hole if it can contain lots of different things inside it?
//        What happens if we send back two views directly from our body property, without wrapping them in a stack?
//        To answer the first question first, if you create a VStack with two text views inside, SwiftUI silently creates a TupleView to contain those two views – a special type of view that holds exactly two views inside it. So, the VStack fills the “what kind of view is this?” with the answer “it’s a TupleView containing two text views.”

//        And what if you have three text views inside the VStack? Then it’s a TupleView containing three views. Or four views. Or eight views, or even ten views – the TupleView just keeps expanding.

//        As for the second question, Swift silently applies a special attribute to the body property called @ViewBuilder. This has the effect of silently wrapping multiple views in one of those TupleView containers, so that even though it looks like we’re sending back multiple views they get combined into one TupleView.
    }
}

#Preview {
    ContentView()
}
