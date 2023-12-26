//
//  ContentView.swift
//  Flag Guesser
//
//  Created by Tony Alhwayek on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gameOver = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var rounds = 0
    
    var body: some View {
        ZStack {
            // LinearGradient(colors: [.mint, .black], startPoint: .top, endPoint: .bottom)
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue:0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.25), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    // Generate flag images
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.buttonBorder)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                // Bottom score label
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is: \(score)")
        }
        .alert("Game Over", isPresented: $gameOver) {
            Button("Retry?", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    // When a flag is tapped
    func flagTapped(_ number: Int) {
        rounds += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[number])"
        }
        
        // Game over comes before showing score because this made them trigger in the right order
        if(rounds >= 2) {
            gameOver = true
        }
        
        showingScore = true;
    }
    
    // Reshuffle array and get new correct answer
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    // Reset
    func resetGame() {
        score = 0
        rounds = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
