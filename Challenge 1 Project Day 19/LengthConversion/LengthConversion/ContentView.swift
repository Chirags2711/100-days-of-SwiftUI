//
//  ContentView.swift
//  LengthConversion
//
//  Created by Chirag Sharma on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    enum Units: CaseIterable{
        case meters, kilometers, feet, yards, miles
    }
    func getMeters(_ unit: Units) -> Double{
        switch(unit){
        case .kilometers:
            return 1000
        case .meters:
            return 1
        case .feet:
            return 0.3048
        case .miles:
            return 1609.34
        case .yards:
            return 0.9144
        }
    }
    @State private var inputUnit = Units.meters
    @State private var outputUnit = Units.meters
    @State private var inputLength = 0.0
    @FocusState private var lengthIsFocused: Bool
    var outputLength: Double{
        let multiplicant = getMeters(inputUnit)
        let dividend = getMeters(outputUnit)
        let result = inputLength * multiplicant / dividend
        return result
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Enter input length and select input unit"){
                    TextField("Input Length", value: $inputLength, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($lengthIsFocused)
                    Picker("Input Unit", selection: $inputUnit){
                        ForEach(Units.allCases, id: \.self){
                            Text(String(describing: $0))
                        }
                    }
                }
                Section("Select output unit"){
                    Picker("Output Unit", selection: $outputUnit){
                        ForEach(Units.allCases, id: \.self){
                            Text(String(describing: $0))
                        }
                    }
                }
                Section("Result"){
                    Text("Output Length: \(outputLength)")
                }
            }
            .navigationTitle("Length Conversion")
            .toolbar{
                if lengthIsFocused{
                    Button("Done"){
                        lengthIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
