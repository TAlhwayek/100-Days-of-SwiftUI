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
    @State private var nameOfUser: String
    @State private var maxNumbers: Int
    @State private var numberOfRounds: Int
    
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
        self.nameOfUser = nameOfUser
        self.maxNumbers = maxNumbers
        self.numberOfRounds = numberOfRounds
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
        .navigationBarBackButtonHidden(true)
        .alert("Game Over", isPresented: $showAlert) {
            Button("End Game") { }
            Button("Restart?") { }
            // Add alert message showing score
        }
    }
    
    
    
    func newRound() {
        if numberOfRounds > 0 {
            numberOfRounds -= 1
            generateRandomNumber()
        } else {
            showAlert = true
        }
        
    }
    
    func generateRandomNumber() {
        answers.removeAll()
        
        for i in 0..<4 {
            let randomNumber1 = Int.random(in: 2...maxNumbers)
            let randomNumber2 = Int.random(in: 2...maxNumbers)
            let result = randomNumber1 * randomNumber2
            answers.append(result)
            
            if i == 3 {
                number1 = randomNumber1
                number2 = randomNumber2
                correctAnswer = result
            }
        }
        
        answers.shuffle()
    }
    
    func checkAnswer(_ number: Int) {
        if correctAnswer == answers[number] {
            score += 1
        } else {
            
        }
        
        newRound()
    }
    
}

#Preview {
    GameView(nameOfUser: "Nameless Player", maxNumbers: 20, numberOfRounds: 10)
}
