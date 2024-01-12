//
//  Custom Containers.swift
//  ViewsAndModifiers
//
//  Created by Chirag Sharma on 12/01/24.
//

import SwiftUI


struct GridStack<Content: View> : View { //Generics
    let rows: Int
    let columns: Int
    
    let content: (Int, Int) -> Content
    
    var body: some View {
        //more to come
        VStack{
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        VStack{
                            content(row, column)
                        }
                    }
                }
            }
        }
    }
}

//The first line – struct GridStack<Content: View>: View – uses a more advanced feature of Swift called generics, which in this case means “you can provide any kind of content you like, but whatever it is it must conform to the View protocol.”


struct Custom_Containers: View {
    var body: some View {
        GridStack(rows: 4, columns: 4, content: {row, col in
            HStack{
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row), C\(col)")
            }
            //make content @ViewBuilder to make HStack unnecessary
        }
        )
    }
}

#Preview {
    Custom_Containers()
}
