//
//  Environment Modifiers.swift
//  ViewsAndModifiers
//
//  Created by Chirag Sharma on 10/01/24.
//

import SwiftUI

struct Environment_Modifiers: View {
    var body: some View {
        VStack{
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title) //Environment modifier
        //but if any child view overrides the same modifier, childversion is prioritized
//        However, this applies a blur effect to the VStack then attempts to disable blurring on one of the text views:

        VStack {
            Text("Gryffindor")
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 5)
//        That won’t work the same way: blur() is a regular modifier, so any blurs applied to child views are added to the VStack blur rather than replacing it.
    }
}

#Preview {
    Environment_Modifiers()
}
