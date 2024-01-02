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
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .mint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Fake RPS")
                    .font(.title2)
                
                Spacer()
                
                Text("Bot selected: \(RPS[selectedRPS])")
                    .font(.title)
                    .padding()
                Text("You should: \(winOrLose())")
                    .font(.title2)
                
                
                Spacer()
                Spacer()
                
                VStack {
                    ForEach(0..<3) { number in
                        Button(action:  {
                            checkAnswer(move: number)
                        }) {
                            Text(RPS[number])
                                .frame(width: 150, height: 50)
                                .foregroundColor(.black)
                                .background(.blue)
                                .contentShape(.buttonBorder)
                                .clipShape(.buttonBorder)
                                .padding(5)
                        }
                    }
                }
                .padding()
                
                Text("Score: \(score)")
                Spacer()
            }
        }
    }
    
    // Proceed to next round
    func nextRound() {
        selectedRPS = Int.random(in: 0...2)
        playerShouldWin = Bool.random()
    }
    
    // Check answer based on user choice
    func checkAnswer(move: Int) {
        // Check logic here
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
    
    func winOrLose() -> String {
        if playerShouldWin {
            return "Win"
        } else {
            return "Lose"
        }
    }
    

    
}

#Preview {
    ContentView()
}
