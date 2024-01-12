//
//  View Combination.swift
//  ViewsAndModifiers
//
//  Created by Chirag Sharma on 10/01/24.
//

import SwiftUI

// 2. Because those two text views are identical apart from their text, we can wrap them up in a new custom view, like this:
struct CapsuleText: View{
    let text: String
    
    var body: some View{
        Text(text)
            .font(.largeTitle)
            .padding()
//            .foregroundStyle(.white) //can remove an attribute and customize others when we need them
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct View_Combination: View {
    // 1. SwiftUI lets us break complex views down into smaller views without incurring much if any performance impact. This means that we can split up one large view into multiple smaller views, and SwiftUI takes care of reassembling them for us.
    var body: some View {
//        VStack(spacing: 10) { //same attributes to both
//            Text("First")
//                .font(.largeTitle)
//                .padding()
//                .foregroundStyle(.white)
//                .background(.blue)
//                .clipShape(.capsule)
//            
//            Text("Second")
//                .font(.largeTitle)
//                .padding()
//                .foregroundStyle(.white)
//                .background(.blue)
//                .clipShape(.capsule)
//        }
        VStack(spacing: 10) { //same attributes to both
            CapsuleText(text: "First")
                .foregroundStyle(.white)
            CapsuleText(text: "Second")
                .foregroundStyle(.yellow) //doesn't override if we keep original one intact
        }
        //It is efficient to break views in SwiftUI, so don't worry about performance
        
    }
}

#Preview {
    View_Combination()
}
