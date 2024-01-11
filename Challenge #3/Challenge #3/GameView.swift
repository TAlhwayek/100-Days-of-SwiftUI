//
//  GameView.swift
//  Challenge #3
//
//  Created by Tony Alhwayek on 1/10/24.
//

import SwiftUI

struct GameButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 180, height: 50)
            .foregroundStyle(.black)
            .background(.blue)
            .clipShape(.capsule)
    }
}

extension View {
    func gameButtonStyle() -> some View {
        modifier(GameButtonStyle())
    }
}

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var nameOfUser: String
    @State private var maxNumbers: Int
    @State private var numberOfRounds: Int
    @State private var roundsPlayed = 0
    
    @State private var number1 = 2
    @State private var number2 = 2
    @State private var correctAnswer = 4
    @State private var answers = [0, 0, 0, 0]
    
    @State private var score = 0
    
    @State private var showAlert = false
    
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    init(nameOfUser: String, maxNumbers: Int, numberOfRounds: Int) {
        self._nameOfUser = State(initialValue: nameOfUser)
        self._maxNumbers = State(initialValue: maxNumbers)
        self._numberOfRounds = State(initialValue: numberOfRounds)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.mint, .green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .onAppear(perform: generateRandomNumber)
            VStack() {
                Spacer()
                
                Text("Can you solve this, \(nameOfUser)?")
                    .font(.title2)
                
                Spacer()
                Spacer()
                
                Text("\(number1) x \(number2)")
                    .font(.system(size: 86).bold())
                
                Spacer()
                Spacer()
                
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(0..<4, id: \.self) { number in
                        Button {
                            checkAnswer(number)
                        } label: {
                            Text("\(answers[number])")
                                .gameButtonStyle()
                        }
                    }
                }
                Spacer()
                
                Text("Score: \(score)")
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Game Over"),
                message: Text("Your final score is \(score)."),
                primaryButton: .default(Text("End Game")) {
                    presentationMode.wrappedValue.dismiss()
                },
                secondaryButton: .default(Text("Restart?")) {
                    restartGame()
                }
            )
        }
    }
    
    
    func newRound() {
        if roundsPlayed < numberOfRounds - 1 {
            roundsPlayed += 1
            generateRandomNumber()
        } else {
            showAlert = true
        }
    }
    
    func generateRandomNumber() {
        answers.removeAll()
        
        var i = 0
        while i < 4 {
            let randomNumber1 = Int.random(in: (maxNumbers - 8)...maxNumbers)
            let randomNumber2 = Int.random(in: (maxNumbers - 8)...maxNumbers)
            let result = randomNumber1 * randomNumber2
            
            // Avoid dupilicates
            if !answers.contains(result) {
                answers.append(result)
                
                if i == 3 {
                    number1 = randomNumber1
                    number2 = randomNumber2
                    correctAnswer = result
                }
                // Increment only if item was appended
                i += 1
            }
        }
        answers.shuffle()
    }
    
    func checkAnswer(_ number: Int) {
        // Could add animation here. Like lowering opacity of all wrong answers or something.
        if correctAnswer == answers[number] {
            score += 1
        }
        //else {
        // Do nothing for now. Maybe show user mistake.
        //}
        newRound()
    }
    
    func restartGame() {
        score = 0
        roundsPlayed = 0
        generateRandomNumber()
    }
    
}

#Preview {
    GameView(nameOfUser: "Nameless Player", maxNumbers: 20, numberOfRounds: 10)
}
