//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Chirag Sharma on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    enum Units: CaseIterable{
        case Celsius, Fahrenheit, Kelvin
    }
    @State private var inputUnit: Units = .Celsius
    @State private var outputUnit: Units = .Celsius
    @State private var inputTemperature = 0.0
    @FocusState private var inputFocused: Bool
    private var outputTemperature: Double{
        var output: Double
        switch inputUnit {
        case .Celsius:
            output = inputTemperature
        case .Fahrenheit:
            output = 5 / 9 * (inputTemperature - 32)
        case .Kelvin:
            output = inputTemperature - 273.15
        }
        switch outputUnit {
        case .Celsius:
            break
        case .Fahrenheit:
            output = 9 / 5 * output + 32
        case .Kelvin:
            output = output + 273.15
        }
        return output
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Enter input Length and select Input unit"){
                    TextField("Input", value: $inputTemperature, format: .number)
                        .focused($inputFocused)
                        .keyboardType(.decimalPad)
                    Picker("Input Unit: ", selection: $inputUnit){
                        ForEach(Units.allCases, id: \.self){
                            Text(String(describing: $0))
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Select output unit"){
                    Picker("Output Unit: ", selection: $outputUnit){
                        ForEach(Units.allCases, id: \.self){
                            Text(String(describing: $0))
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Converted Temperature"){
                    Text(outputTemperature.formatted())
                }
            }
            .navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        inputFocused = false
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
