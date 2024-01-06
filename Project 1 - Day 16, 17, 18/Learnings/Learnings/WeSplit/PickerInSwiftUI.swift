//
//  PickerInSwiftUI.swift
//  WeSplit
//
//  Created by Chirag Sharma on 28/12/23.
//

import SwiftUI

struct PickerInSwiftUI: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    var body: some View {
        NavigationStack{
            Form{
                Picker("Select your favorite Student", selection: $selectedStudent){
                    ForEach(students, id: \.self){
                        //the id: \.self part is important. This exists because SwiftUI needs to be able to identify every view on the screen uniquely, so it can detect when things change.
                        //So, when we’re using ForEach to create many views and SwiftUI asks us what identifier makes each item in our string array unique, our answer is \.self, which means “the strings themselves are unique.” This does of course mean that if you added duplicate strings to the students array you might hit problems, but here it’s just fine.
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    PickerInSwiftUI()
}
