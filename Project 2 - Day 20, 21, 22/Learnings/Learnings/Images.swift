//
//  Images.swift
//  Learnings
//
//  Created by Chirag Sharma on 09/01/24.
//

import SwiftUI

struct Images: View {
    var body: some View {
        Image("pencil") //loads pencil image that we have added to our project.
        Image(decorative: "pencil") //will load the same image, but won’t read it out for users who have enabled the screen reader. This is useful for images that don’t convey additional important information.
        
        
        
        
        Image(systemName: "pencil") //built in iOS image for pencil. or SF Symbol
        
        
        Button {
            print("Edit button was tapped")
        } label: {
            Image(systemName: "pencil")
        }
        .tint(.black)
        
        
//        If you want both text and image at the same time, you have two options. The first is provide them both to the Button directly, like this:

        Button("Edit", systemImage: "pencil") {
            print("Edit button was tapped")
        }
        
        //More custom:(second)
        Button {
            print("Edit button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
        
        //Both of those will show both a pencil icon and the word “Edit” side by side, which on the surface sounds exactly the same as what we’d get by using a simple HStack. However, SwiftUI is really smart: it will automatically decide whether to show the icon, the text, or both depending on how they are being used in our layout, which makes this option a great choice.

        
    }
}

#Preview {
    Images()
}
