//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Chirag Sharma on 09/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State var correntAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var showingFinalAlert = false
    @State private var numberOfGames = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack{
                Spacer()
                
                Text("Guess the Flag  \(numberOfGames+1) / 8")
                    .font(.largeTitle.bold()) //or .largeTitle.weight(.bold)
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) { //30 spacing between every view inside it
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correntAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                        //largeTitle, subHeading are dynamic types. acc to user settings
                    }
                    
                    ForEach(0..<3){
                        number in
                        Button{
                            // flag was tapped
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                            //capsule: it ensures the corners of the shortest edges are fully rounded, while the longest edges remain straight
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue"){
                askQuestion()
                if numberOfGames == 8 {
                    showingFinalAlert = true
                }
            }
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over", isPresented: $showingFinalAlert){
            Button("Restart"){
                reset()
            }
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correntAnswer {
            scoreTitle = "Correct"
            score += 1
        }else{
            scoreTitle =  "Wrong! That’s the flag of \(countries[number])"
            score -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correntAnswer = Int.random(in: 0...2 )
        numberOfGames += 1
    }
    
    func reset(){
        countries.shuffle()
        correntAnswer = Int.random(in: 0...2)
        score = 0
        numberOfGames = 0
    }
    
}

#Preview {
    ContentView()
}
