//
//  Buttons and images.swift
//  Learnings
//
//  Created by Chirag Sharma on 09/01/24.
//

import SwiftUI

struct Buttons_and_images: View {
    var body: some View {
        Button("Delete Selection", action: {print("Closure")})
        Button("Delete Selection", role: .destructive){
            print("Closure method 2")
        }
        Button(action: executeDelete, label: {
            Text("Button")
        })
        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
        }
        Button("Button 5"){}
            .tint(.mint)
            .buttonStyle(.borderedProminent)
        Button{
            print("Button was tapped")
        } label: {
            //Can have any View here, even Image
            Text("Press Me")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
    }
    //Important: Apple explicitly recommends against using too many prominent buttons, because when everything is prominent nothing is.
    func executeDelete(){
        print("Function")
    }
}

#Preview {
    Buttons_and_images()
}
