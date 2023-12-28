//
//  ContentView.swift
//  Flag Guesser
//
//  Created by Tony Alhwayek on 12/18/23.
//

import SwiftUI


// Project #3 - Challenge #2
struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(.buttonBorder)
            .shadow(radius: 5)
    }
}

// Project #3 - Challenge #3
struct GreenTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.semibold))
            // Green is more visible than blue in this case
            .foregroundStyle(.green)
    }
}

extension View {
    func GreenTitleStyle() -> some View {
        modifier(GreenTitle())
    }
}

struct ContentView: View {
    
    @State private var gameOver = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
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
                            .GreenTitleStyle()
                    }
                    
                    // Generate flag images
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(image: countries[number])
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
            Text(scoreMessage)
        }
        .alert(scoreTitle, isPresented: $gameOver) {
            Button("Done") { }
            Button("Retry?", action: resetGame)
        } message: {
            Text(scoreMessage)
        }
    }
    
    // When a flag is tapped
    func flagTapped(_ number: Int) {
        if rounds < 8 {
            rounds += 1
            
            if number == correctAnswer {
                scoreTitle = "You got it!"
                score += 1
            } else {
                scoreTitle = "Wrong. That's the flag of \(countries[number])"
            }
            
            scoreMessage = rounds >= 8 ? "Game Over\nFinal score: \(score)" : "Your score is: \(score)"
            // Determine which alert to show based on round
            showingScore = rounds < 8 ? true : false
            gameOver = rounds >= 8 ? true : false
        }
        // Do nothing after rounds are over
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
