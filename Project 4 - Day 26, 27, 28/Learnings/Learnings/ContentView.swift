//
//  ContentView.swift
//  Learnings
//
//  Created by Chirag Sharma on 18/01/24.
//

import SwiftUI

struct ContentView: View {
    //Steppers
    @State private var sleepAmount = 8.0
    var body: some View {
        VStack {
//            Stepper("\(sleepAmount) hours", value: $sleepAmount)
            //By default steppers are limited only by the range of their storage.
//            Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12)
            //There’s a fourth useful parameter for Stepper, which is a step value – how far to move the value each time - or + is tapped. Again, this can be any sort of number, but it does need to match the type used for the binding. So, if you are binding to an integer you can’t then use a Double for the step value.
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
