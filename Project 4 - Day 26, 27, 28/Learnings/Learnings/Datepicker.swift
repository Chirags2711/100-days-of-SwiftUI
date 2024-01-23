//
//  Working with dates.swift
//  Learnings
//
//  Created by Chirag Sharma on 18/01/24.
//

import SwiftUI

struct Datepicker: View {
    @State private var wakeUp = Date.now
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp)
            .labelsHidden() //removes label. If given "" as label, it still leaves empty space.
            //label still significatnt for VoiceOver. but now they aren’t visible onscreen any more – the date picker won’t be pushed to one side by some empty text.
            .padding()
//        Date pickers provide us with a couple of configuration options that control how they work. First, we can use displayedComponents to decide what kind of options users should see:
//
//        If you don’t provide this parameter, users see a day, hour, and minute.
//        If you use .date users see month, day, and year.
//        If you use .hourAndMinute users see just the hour and minute components.
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .date)
            .labelsHidden()
            .padding()
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
            .padding()
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...) //now onwards

    }
//    we can also use Swift dates with ranges. For example:

    func exampleDates() {
        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400)

        // create a range from those two
        let range = Date.now...tomorrow
    }
    //there’s something even better: Swift lets us form one-sided ranges – ranges where we specify either the start or end but not both, leaving Swift to infer the other side.
}

#Preview {
    Datepicker()
}
