//
//  Gradients.swift
//  Learnings
//
//  Created by Chirag Sharma on 08/01/24.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        //Gradients are made up of several components:
//        1. An array of colors to show
//        2. Size and direction information
//        3. The type of gradient to use
//        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
        
        
        //Gradient stops
//        LinearGradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45), //white upto 45 percent of available space
//            Gradient.Stop(color: .black, location: 0.65), //black after 65 percent of available space
//        ], startPoint: .top, endPoint: .bottom)
        
        
//    Tip: Swift knows we’re creating gradient stops here, so as a shortcut we can just write .init rather than Gradient.Stop, like this:
//        LinearGradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55),
//        ], startPoint: .top, endPoint: .bottom)
        
        //Radial
//        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        
        //Angular
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
        //All of these gradient types can have stops provided rather than simple colors. Plus, they can also work as standalone views in your layouts, or be used as part of a modifier – you can use them as the background for a text view, for example.
        
//        This gradient is created by simply adding .gradient after any color – SwiftUI will automatically convert your color into a very gentle linear gradient.
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.red.gradient)
        
    }
}

#Preview {
    Gradients()
}
