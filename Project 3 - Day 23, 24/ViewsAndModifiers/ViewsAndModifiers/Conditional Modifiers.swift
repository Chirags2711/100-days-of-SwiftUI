//
//  Conditional Operator.swift
//  ViewsAndModifiers
//
//  Created by Chirag Sharma on 10/01/24.
//

import SwiftUI

struct Conditional_Operator: View {
    @State private var useRedtext = false
    
    var body: some View {
        Button("Toggle"){
            useRedtext.toggle()
        }
        .foregroundStyle(useRedtext ? .red: .blue)
        //You can often use regular if conditions to return different views based on some state, but this actually creates more work for SwiftUI – rather than seeing one Button being used with different colors, it now sees two different Button views, and when we flip the Boolean condition it will destroy one to create the other rather than just recolor what it has.
    }
}

#Preview {
    Conditional_Operator()
}
