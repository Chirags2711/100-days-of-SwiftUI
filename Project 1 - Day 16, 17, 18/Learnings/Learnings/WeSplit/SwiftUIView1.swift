//
//  SwiftUIView1.swift
//  WeSplit
//
//  Created by Chirag Sharma on 28/12/23.
//

import SwiftUI

struct SwiftUIView1: View {
    //    var tapCount = 0
    @State var tapCount = 0
    
    var body: some View { //body is computed property, returning some View(opaque return type)
        //        NavigationStack{
        //            //Usually want to put some sort of title in the navigation bar, and you can do that by attaching a modifier to whatever you’ve placed inside.
        //            Form { //Row can move under the clock if scrolled. To fix it, use Navigation bar
        //                Section {
        //                    Text("Hello, world!")
        //                }
        //
        //                Section {
        //                    Text("Hello, world!")
        //                    Text("Hello, world!")
        //                }
        //            }
        //            .navigationTitle("SwiftUI")
        //            .navigationBarTitleDisplayMode(.inline) //Smaller font
        //        }
        //button can be created with a title string and an action closure that gets run when the button is tapped:
        //        Button("Tap Count: \(tapCount)", action: {
        //            tapCount+=1
        //        }) //OR
        Button("Tap Count: \(tapCount)"){
            tapCount += 1
        }
        //Swift doesn’t let us make mutating computed properties, which means we can’t write mutating var body: some View – it just isn’t allowed.
        //Fortunately, Swift gives us a special solution called a property wrapper: a special attribute we can place before our properties that effectively gives them super-powers. In the case of storing simple program state like the number of times a button was tapped, we can use a property wrapper from SwiftUI called @State
        //@State allows us to work around the limitation of structs: we know we can’t change their properties because structs are fixed, but @State allows that value to be stored separately by SwiftUI in a place that can be modified.
        //@State is specifically designed for simple properties that are stored in one view. As a result, Apple recommends we add private access control to those properties, like this: @State private var tapCount = 0.
        
    }
}

#Preview {
    SwiftUIView1()
}
