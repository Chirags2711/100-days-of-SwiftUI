//
//  ContentView.swift
//  Learnings
//
//  Created by Chirag Sharma on 30/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        By default VStack places some automatic amount of spacing between the two views, but we can control the spacing by providing a parameter when we create the stack. Default alignment: centered
        VStack(alignment: .leading, spacing: 20) {
            Spacer() //1-3rd above
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Spacer()
            Spacer() //2-3rd bottom
        }
        VStack{
            HStack{
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
            HStack{
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
            HStack{
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
            Spacer()
        }
        HStack(spacing: 20) {
            Text("Hello, world!")
            Text("This is inside a stack")
        }
        ZStack(alignment: .top) {
            Text("Hello, world!")
            Text("This is inside a stack")
        }
        //ZStack draws its contents from top to bottom, back to front. This means if you have an image then some text ZStack will draw them in that order, placing the text on top of the image.
    }
}

#Preview {
    ContentView()
}
