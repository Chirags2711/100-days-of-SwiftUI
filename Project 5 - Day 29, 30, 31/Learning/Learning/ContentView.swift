//
//  ContentView.swift
//  Learning
//
//  Created by Chirag Sharma on 02/02/24.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
//        List{  // same as form here
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//        }
        
//        List{  // same as form here
//            ForEach(0..<3){
//                Text("Dynamic Row \($0)")
//            }
//        }
        
//        List{  // same as form here
//            Section("Section 1"){
//                Text("Static Row 1")
//            }
//            Section("Section 2"){
//                Text("Static Row 2")
//                ForEach(0..<3){
//                    Text("Dynamic Row \($0)")
//                }
//                Text("Static Row 3")
//            }
//            Section("Section 3"){
//                Text("Static Row 4")
//            }
//        }
////        .formStyle(.columns) //Won't work with lists
//        .listStyle(.grouped) // Won't work with forms
        
        //Now, everything you’ve seen so far works fine with Form as well as List – even the dynamic content. But one thing List can do that Form can’t is to generate its rows entirely from dynamic content without needing a ForEach.
//        List(0..<5){
//            Text("Dynamic Row \($0)")
//        }
        //In this project we’re going to use List slightly differently, because we’ll be making it loop over an array of strings. We’ve used ForEach with ranges a lot, either hard-coded (0..<5) or relying on variable data (0..<students.count), and that works great because SwiftUI can identify each row uniquely based on its position in the range.
        //When working with an array of data, SwiftUI still needs to know how to identify each row uniquely, so if one gets removed it can simply remove that one rather than having to redraw the whole list. This is where the id parameter comes in, and it works identically in both List and ForEach – it lets us tell SwiftUI exactly what makes each item in the array unique.
        List(people, id: \.self) {
            Text($0)
        }
        //That works just the same with ForEach, so if we wanted to mix static and dynamic rows we could have written this instead:
        
        List {
            Text("Static Row")

            ForEach(people, id: \.self) {
                Text($0)
            }

            Text("Static Row")
        }
        
    }
}

#Preview {
    ContentView()
}
