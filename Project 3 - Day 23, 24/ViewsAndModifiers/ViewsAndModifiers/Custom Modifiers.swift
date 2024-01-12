//
//  Custom Modifiers.swift
//  ViewsAndModifiers
//
//  Created by Chirag Sharma on 11/01/24.
//

import SwiftUI


struct Title: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

// 2. When working with custom modifiers, it’s usually a smart idea to create extensions on View that make them easier to use. For example, we might wrap the Title modifier in an extension such as this:
extension View{
    func titleStyle() -> some View {
        modifier(Title())
    }
}


// 3. Custom modifiers can do much more than just apply other existing modifiers – they can also create new view structure, as needed. Remember, modifiers return new objects rather than modifying existing ones, so we could create one that embeds the view in a stack and adds another view:

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing, content: {
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        })
    }
}

extension View {
    func watermarked(with text: String) -> some View{
        modifier(Watermark(text: text))
    }
}
//Tip: Often folks wonder when it’s better to add a custom view modifier versus just adding a new method to View, and really it comes down to one main reason: custom view modifiers can have their own stored properties, whereas extensions to View cannot.

struct Custom_Modifiers: View {
    var body: some View {
        Text("Hello, World!")
//            .modifier(Title()) // 1.
            .titleStyle() //used in exact same way now as original
        
        // 3
        Color.purple
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
    }
}




#Preview {
    Custom_Modifiers()
}
