//
//  ContentView.swift
//  WeSplit
//
//  Created by Chirag Sharma on 28/12/23.
//

import SwiftUI

struct ContentView: View { //View is a protocol, anything we want to draw on screen
        @State var tapCount = 0
        
        var body: some View {
            NavigationStack{
                Form {
                    Section {
                        Text("Hello, world!")
                    }
    
                    Section {
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }
                }
                .navigationTitle("SwiftUI")
                .navigationBarTitleDisplayMode(.inline) //Smaller font
            }
    }
}

#Preview {
    ContentView()
}
