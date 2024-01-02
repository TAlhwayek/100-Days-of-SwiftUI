//
//  ContentView.swift
//  Challenge #2
//
//  Created by Tony Alhwayek on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var RPS = ["Rock", "Paper", "Scissors"]
    @State private var selectedRPS = Int.random(in: 0...2)
    @State private var playerShouldWin = Bool.random()
    
    var body: some View {
        ZStack {
            VStack {
                Text("Fake RPS")
                
                VStack {
                    ForEach(RPS, id: \.self) { move in
                        Button() {
                            checkAnswer(move: move)
                        } label: {
                            Text(move)
                        }
                    }
                }
            }
        }
    }
    
    // Check answer based on user choice
    func checkAnswer(move: String) {
//        print("You selected \(move)")
    }
    
    // Proceed to next round
    func nextRound() {
        selectedRPS = Int.random(in: 0...2)
        playerShouldWin.toggle()
    }
}

#Preview {
    ContentView()
}
