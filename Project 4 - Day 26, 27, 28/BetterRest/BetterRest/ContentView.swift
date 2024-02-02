//
//  ContentView.swift
//  BetterRest
//
//  Created by Chirag Sharma on 23/01/24.
//

//When you add an .mlmodel file to Xcode, it will automatically create a Swift class of the same name. You can’t see the class, and don’t need to – it’s generated automatically as part of the build process.
import CoreML
import SwiftUI
//Ordered in alphabetical order just for convenience
// You cannot set one stored property's initial value by referencing another stored property.
//Swift's initialization rules does not allow this for safety reasons.

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    //Cannot use instance member 'defaultWakeTime' within property initializer; property initializers run before 'self' is available
    //So, make it static.
    
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var coffeeAmountPicker = 1

    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack{
            Form{ //Changed from VStack for readability. //Separate into Sections. Better: into VStacks
                Section/*VStack(alignment: .leading, spacing: 0)*/{ //or Section everywhere
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section/*VStack(alignment: .leading, spacing: 0)*/{
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section/*VStack(alignment: .leading, spacing: 0)*/{
                    Text("Daily coffee intake")
                        .font(.headline)
//                    Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                    //Better way:
//                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                    
                    //Swift can handle plurization for us in an even better way, preciser to String
//                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    //we can write cup/cups here, does not matter
                    //It is a specialized form of Markdown formatting language, a common text-format used in web
                    //This syntax tells SwiftUI that the word "cup" needs to be inflected to match whatever is in the coffeeAmount variable, which in this case means it will automatically be converted from "cup" to "cups" as appropriate.
                    
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount){
                        ForEach(1..<21, id: \.self){num in //id used to remove mismatch
                            Text("^[\(num) cup](inflect: true)")
                        }
                    }
                }
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate"){
                    calculateBedTime()
                }
            }
            .alert(alertTitle, isPresented: $showingAlert){
                Button("OK"){}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedTime() {
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            //error might be :
            // 1. while loading the model
            // 2. failed prediction
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try! model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            // we can subtract seconds directly from any date. It gives us a new date. (Due to Swift APIs)
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
