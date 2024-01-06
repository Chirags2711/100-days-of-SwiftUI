//
//  SwiftUIView2.swift
//  WeSplit
//
//  Created by Chirag Sharma on 28/12/23.
//

import SwiftUI

struct SwiftUIView2: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            //In the case of our text field, Swift needs to make sure whatever is in the text is also in the name property, so that it can fulfill its promise that our views are a function of their state – that everything the user can see is just the visible representation of the structs and properties in our code.
            //This is what’s called a two-way binding: we bind the text field so that it shows the value of our property, but we also bind it so that any changes to the text field also update the property.
            //In Swift, we mark these two-way bindings with a special symbol so they stand out: we write a dollar sign before them. This tells Swift that it should read the value of the property but also write it back as any changes happen.
            Text("Your name is \(name)")
            //Notice how that uses name rather than $name? That’s because we don’t want a two-way binding here – we want to read the value, yes, but we don’t want to write it back somehow, because that text view won’t change.
            
            
            
            
            //ForEach can loop over arrays and ranges, creating as many views as needed. ForEach will run a closure once for every item it loops over, passing in the current loop item.
            Section{
                ForEach(0..<100){
                    Text("Row \($0)") //or number in Text("Row \(number)")
                }
            }
        }
    }
}

#Preview {
    SwiftUIView2()
}
