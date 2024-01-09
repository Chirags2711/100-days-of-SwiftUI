//
//  Colors and frames 2.swift
//  Learnings
//
//  Created by Chirag Sharma on 08/01/24.
//

import SwiftUI

struct Colors_and_frames_2: View {
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
            Text("Your content")
                .foregroundStyle(.secondary) //Fades the Text
                .padding(50)
                .background(.ultraThinMaterial)
            //iOS automatically adapts the effect based on whether the user has light or dark mode enabled – our material will either be light-colored or dark-colored, as appropriate.
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Colors_and_frames_2()
}
