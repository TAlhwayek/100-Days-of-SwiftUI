//
//  ContentView.swift
//  Challenge #2
//
//  Created by Tony Alhwayek on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var RPS = ["Rock 🪨", "Paper 📃", "Scissors ✂️"]
    @State private var selectedRPS = Int.random(in: 0...2)
    @State private var playerShouldWin = Bool.random()
    @State private var score = 0
    
    // For alert
    @State private var roundsPlayed = 0
    @State private var showFinalAlert = false
    
    let buttonColors: [Color] = [.red, .blue, .green]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .mint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                // Title
                Text("Fake RPS")
                    .font(.title2)
                
                Spacer()
                
                VStack {
                    // Two middle headers
                    HStack {
                        Text("Bot selected:")
                        Text(RPS[selectedRPS])
                            .bold()
                    }
                    .font(.title)
                    
                    HStack {
                        Text("You should:")
                        Text(winOrLose())
                            .bold()
                    }
                    .font(.title)
                    .padding(5)
                }
                
                Spacer()
                Spacer()
                
                // Creating buttons
                VStack {
                    ForEach(0..<3) { number in
                        Button(action:  {
                            checkAnswer(move: number)
                        }) {
                            Text(RPS[number])
                                .frame(width: 150, height: 50)
                                .foregroundColor(.black)
                                .background(buttonColors[number])
                                .contentShape(.buttonBorder)
                                .clipShape(.buttonBorder)
                                .padding(5)
                        }
                    }
                }
                .padding()
                
                // Score text
                Text("Score: \(score)")
                Spacer()
            }
        }
        .alert("Game Over", isPresented: $showFinalAlert) {
            Button("Restart?", action: resetGame)
        } message: {
            Text("In 10 rounds, you got \(score) points")
        }
    }
    
    // Proceed to next round
    func nextRound() {
        if(roundsPlayed >= 10) {
            showFinalAlert = true
        } else {
            selectedRPS = Int.random(in: 0...2)
            playerShouldWin.toggle()
        }
    }
    
    // Check answer based on user choice
    func checkAnswer(move: Int) {
        roundsPlayed += 1
        
        switch selectedRPS {
        // If bot selected rock
        case 0:
            if (move == 1 && playerShouldWin) || (move == 2 && !playerShouldWin) {
                score += 1
            }
            
        // If bot selected paper
        case 1:
            if (move == 2 && playerShouldWin) || (move == 0 && !playerShouldWin) {
                score += 1
            }
            
        // If bot selected scissors
        case 2:
            if (move == 0 && playerShouldWin) || (move == 1 && !playerShouldWin) {
                score += 1
            }
            
        default:
            // No clue what to put here
            print("Error")
        }
        nextRound()
    }
    
    // Return text based on bool
    func winOrLose() -> String {
        if playerShouldWin {
            return "Win"
        } else {
            return "Lose"
        }
    }
    
    // Reset game upon restart
    func resetGame() {
        score = 0
        roundsPlayed = 0
        nextRound()
    }
    
}

#Preview {
    ContentView()
}
