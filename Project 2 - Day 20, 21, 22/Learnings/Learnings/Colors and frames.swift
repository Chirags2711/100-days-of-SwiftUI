//
//  Colors and frames.swift
//  Learnings
//
//  Created by Chirag Sharma on 07/01/24.
//

import SwiftUI

struct Colors_and_frames: View {
    var body: some View {
//        ZStack{
//            Color.red //Color.red is a view in its own
//            Text("Text 2")
//        }
//        .background(.blue) //Works differently if Color is added in ZStack as well
// When we were using the background() modifier, SwiftUI was able to figure out that .red actually meant Color.red.
        VStack {
            Color.red
                .frame(width: 200, height: 200)
            Color.blue
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            //semantic colors:
            Color.primary //Depends on mode(light: Black, dark: White)
            Color.secondary //faded primary
            Color(red: 1, green: 0.8, blue: 0) //between 0 and 1
        }
        .ignoresSafeArea() //ignores safe area(safe area is area where we can draw, leaving near top notch and bottom most
        //If your content is just decorative – like our background color here – then extending it outside the safe area is okay.
    }
}

#Preview {
    Colors_and_frames()
}


//Even when taking up the full screen, you’ll see that using Color.red will leave some space white.

//How much space is white depends on your device, but on iPhones with Face ID – iPhone 15, for example – you’ll find that both the dynamic island area (the capsule-shaped area at the top) and the home indicator (the horizontal stripe at the bottom) are left uncolored.

//This space is left intentionally blank, because Apple doesn’t want important content to get obscured by other UI features or by any rounded corners on your device. So, the remaining part – that whole middle space – is called the safe area, and you can draw into it freely without worrying that it might be clipped by the notch on an iPhone.


