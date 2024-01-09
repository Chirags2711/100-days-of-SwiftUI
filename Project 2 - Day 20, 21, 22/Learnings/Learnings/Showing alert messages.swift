//
//  Showing alert messages.swift
//  Learnings
//
//  Created by Chirag Sharma on 09/01/24.
//

import SwiftUI

struct Showing_alert_messages: View {
    @State private var showingAlert = false
    var body: some View {
        Button("Show Alert"){
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this message")
        }
//        .alert("Important message", isPresented: $showingAlert){
//            Button("Done"){}
//            //That’s an empty closure, meaning that we aren’t assigning any functionality to run when the button is pressed. That doesn’t matter, though, because any button inside an alert will automatically dismiss the alert – that closure is there to let us add any extra functionality beyond just dismissing the alert.
//        }
//        //The first part is the alert title, which is straightforward enough, but there’s also another two-way data binding because SwiftUI will automatically set showingAlert back to false when the alert is dismissed.
    }
}

#Preview {
    Showing_alert_messages()
}
