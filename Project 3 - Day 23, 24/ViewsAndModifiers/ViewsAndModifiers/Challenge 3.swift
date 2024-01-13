//
//  Challenge 3.swift
//  ViewsAndModifiers
//
//  Created by Chirag Sharma on 13/01/24.
//

import SwiftUI

struct Prominent: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View{
    func makeProminent() -> some View{
        /*self.*/modifier(Prominent())
    }
}

struct Challenge_3: View {
    var body: some View {
        Text("Hello, World!")
//            .modifier(Prominent())
            .makeProminent()
    }
}

#Preview {
    Challenge_3()
}
