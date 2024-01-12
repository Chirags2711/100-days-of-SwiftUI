//
//  Views as Properties.swift
//  ViewsAndModifiers
//
//  Created by Chirag Sharma on 10/01/24.
//

import SwiftUI

struct Views_as_Properties: View {
    //There are lots of ways to make it easier to use complex view hierarchies in SwiftUI, and one option is to use properties – to create a view as a property of your own view, then use that property inside your layouts.
//    let motto1 = Text("Draco dormiens")
    // 2. However, we can use computed properties
    var motto1: some View{
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")
    
//    var spells: some View{ //SwiftUI does not add @ViewBuilder here, unlike body property. Error.
//        Text("Lumos")
//        Text("Obliviate")
//    }
    
    //3 options:
    var spells1: some View{
        VStack{
            Text("Lumos")
            Text("Obliviate")
        }
    }
    var spells2: some View{
        Group{
            Text("Lumos")
            Text("Obliviate")
        }
    }
    @ViewBuilder var spells3: some View{ //preferred(homogenity)
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
            // 1. Swift doesn’t let us create one stored property that refers to other stored properties, because it would cause problems when the object is created. This means trying to create a TextField bound to a local property will cause problems.
        }
    }
}

#Preview {
    Views_as_Properties()
}
