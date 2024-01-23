//
//  ContentView.swift
//  Rock Paper Scisssors
//
//  Created by Chirag Sharma on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    enum Moves: CaseIterable{
        case Rock, Paper, Scissors
    }
    @State private var appMove = Moves.allCases.randomElement()
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var numOfGames = 0
    @State private var showingFinalScore = false
        
    var body: some View {
        ZStack{
            
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Rock, Paper and Scissors \(numOfGames+1) / 5")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    
                    VStack{
                        Text("App's Move: \(String(describing: appMove!))")
                            .font(.title.bold())
                            .foregroundStyle(.black)
                        Text("Your Task: \(shouldWin ? "Win" : "Lose")")
                            .font(.title2.bold())
                            .foregroundStyle(shouldWin ? .green : .red)
                    }
                    
                    ForEach(Moves.allCases, id: \.self){ move in
                        Button(String(describing: move)){
                            playerChose(move)
                        }
                        .foregroundStyle(.secondary)
                        .font(.title.bold())
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.purple)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue"){
                numOfGames += 1
                if numOfGames >= 5 {
                    showingFinalScore = true
                }else{
                    nextRound()
                }
            }
        } message: {
            Text("Your score is: \(score)")
        }
        .alert("Game Over", isPresented: $showingFinalScore){
            Button("Reset"){
                reset()
            }
        } message: {
            Text("Your final score is: \(score)")
        }
    }
    
    func playerChose(_ move: Moves){
        if move == appMove {
            scoreTitle = "That's a draw"
        }else {
            if shouldWin{
                if appMove == .Rock && move == .Paper || appMove == .Paper && move == .Scissors || appMove == .Scissors && move == .Rock {
                    scoreTitle = "Correct!!"
                    score += 1
                }else{
                    scoreTitle = "Wrong"
                    score -= 1
                }
            }else{
                if appMove == .Rock && move == .Scissors || appMove == .Paper && move == .Rock || appMove == .Scissors && move == .Paper {
                    scoreTitle = "Correct!!"
                    score += 1
                }else{
                    scoreTitle = "Wrong"
                    score -= 1
                }
            }
        }
        showingScore = true
    }
    
    func nextRound(){
        appMove = Moves.allCases.randomElement()
        shouldWin = Bool.random()
    }
    
    func reset(){
        numOfGames = 0
        score = 0
        nextRound()
    }
}

#Preview {
    ContentView()
}
