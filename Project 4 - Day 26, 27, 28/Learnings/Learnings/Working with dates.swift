//
//  Working with dates.swift
//  Learnings
//
//  Created by Chirag Sharma on 22/01/24.
//


//REFER HWS
import SwiftUI

struct Working_with_dates: View {
    var body: some View {
        Button("Press Me"){
            exampleDates()
        }
        Text(Date.now, format: .dateTime.hour().minute())
        Text(Date.now, format: .dateTime.day().month().year())
        //we are not arranging it. iOS automatically formats a date differently based on user's preferences
        
        Text(Date.now.formatted())
        Text(Date.now.formatted(date: .long, time: .standard))
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
    func exampleDates(){
        //Making date from date components
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
//        //date might not be valid. So, it is an optional
        
        
        //Extracting components
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now) //returns hour and minure from now. Can write a custom date
        //Set of Calender.components
        print(components)
        let hour = components.hour ?? 0 //Otherwise it is optional(hour Value)
        let minute = components.minute ?? 0
        print(hour)
        print(minute)
        //Fromatting date and time
    }
}

#Preview {
    Working_with_dates()
}
