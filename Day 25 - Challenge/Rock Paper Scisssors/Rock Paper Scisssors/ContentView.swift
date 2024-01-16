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
        
    var body: some View {
        ZStack{
            VStack {
                Text("Score: \(score)")
                Text("App's Move: \(String(describing: appMove!))")
                Text("Your Task: \(shouldWin ? "Win" : "Lose")")
                
                ForEach(Moves.allCases, id: \.self){ move in
                    Button(String(describing: move)){
                        playerChose(move)
                    }
                }
                
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue"){
                nextRound()
            }
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
}

#Preview {
    ContentView()
}
