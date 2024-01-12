//
//  ContentView.swift
//  WeSplit
//
//  Created by Chirag Sharma on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    //One of the great things about the @State property wrapper is that it automatically watches for changes, and when something happens it will automatically re-invoke the body property.
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = tipValue + checkAmount
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    @FocusState private var amountIsFocused: Bool
    //This is exactly like a regular @State property, except it’s specifically designed to handle input focus in our UI.
    var body: some View {
        //SwiftUI allows no more than 10 child views inside each parent. To counter, place inside Groups
        NavigationStack{
            Form{
                //Section is basically the same as a Goup except that a Section is meant to be used inside of a Form and will try to format its contents to look a little bit nicer inside of the Form.
                Section{
                    
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                //Fortunately, text fields have a modifier that lets us force a different kind of keyboard: keyboardType(). We can give this a parameter specifying the kind of keyboard we want, and in this instance either .numberPad or .decimalPad are good choices. Both of those keyboards will show the digits 0 through 9 for users to tap on, but .decimalPad also shows a decimal point so users can enter check amount like $32.50 rather than just whole number
                
                
                Section("How much tip do you want to leave?"){
                    //SwiftUI lets us add views to the header and footer of a section, which in this instance we can use to add a small explanatory prompt.
                    Picker("Tip Percentage", selection: $tipPercentage){
//                        ForEach(tipPercentages, id: \.self){
//                            Text($0, format: .percent)
//                        }
                        ForEach(0..<101){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                
                Section("Total amount of check"){
                    Text("\(totalPerPerson * Double(numberOfPeople + 2))")
                }
                
                
                
                Section{
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){ //Default = 2, it shows 2nd row(0 based indexing)
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink) //Add navigation stack to prevent greying out(Allows us to slide in views).
                    //Default picker style is .menu
                }
                
                
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(tipPercentage == 0 ? .red : .primary)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar(content: {
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            })
        }
        //It’s tempting to think that modifier should be attached to the end of the NavigationStack, but it needs to be attached to the end of the Form instead. The reason is that navigation stacks are capable of showing many views as your program runs, so by attaching the title to the thing inside the navigation stack we’re allowing iOS to change titles freely.
    }
}
//Tip: The .numberPad and .decimalPad keyboard types tell SwiftUI to show the digits 0 through 9 and optionally also the decimal point, but that doesn’t stop users from entering other values. For example, if they have a hardware keyboard they can type what they like, and if they copy some text from elsewhere they’ll be able to paste that into the text field no matter what is inside that text. That’s OK, though – the text field will automatically filter out bad values when they hit Return.

#Preview {
    ContentView()
}


//All SwiftUI views must have a body property.
//This body must always return precisely one view. That view might contain more views inside it, but you still need to return precisely one from the computed property.
