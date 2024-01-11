//
//  ContentView.swift
//  Challenge #3
//
//  Created by Tony Alhwayek on 1/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var maxNumbers = 5
    @State private var numberOfRounds = 10
    @State private var nameOfUser = ""
    
    // Figure out how to go back to this view once game is over
    @State private var path = [Int]()
    
    var questionCount = [5, 10, 15, 20, 1000]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.mint, .green], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    // Name
                    VStack {
                        Text("Enter your name")
                            .font(.headline)
                        HStack {
                            TextField("Name?", text: $nameOfUser)
                                .multilineTextAlignment(.center)
                        }
                        
                    }
                    .frame(width: 300, height: 80)
                    .background(.mint)
                    .clipShape(.rect(cornerRadius: 5))
                    .border(Color.black, width: 2)
                    .cornerRadius(5)
                    
                    // Difficulty
                    VStack {
                        Text("Max number: ")
                            .font(.headline)
                        
                        Stepper("\(maxNumbers)", value: $maxNumbers, in: 2...20)
                            .frame(width: 250, height: 40)
                    }
                    .frame(width: 300, height: 80)
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 5))
                    .border(Color.black, width: 2)
                    .cornerRadius(5)
                    
                    // Question count
                    VStack {
                        Text("Number of questions: ")
                            .font(.headline)
                        Picker("Questions", selection: $numberOfRounds) {
                            ForEach(questionCount, id: \.self) { count in
                                if count != 1000 {
                                    Text("\(count)")
                                } else {
                                    Text("∞")
                                }
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .frame(width: 300, height: 80)
                    .background(.purple)
                    .clipShape(.rect(cornerRadius: 5))
                    .border(Color.black, width: 2)
                    .cornerRadius(5)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    // Start button
                    if(nameOfUser == "") {
                        Button("Enter name first") {
                            
                        }
                        .frame(width: 200, height: 50)
                        .background(.gray)
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                    } else {
                        NavigationLink(destination: GameView(nameOfUser: nameOfUser, maxNumbers: maxNumbers, numberOfRounds: numberOfRounds)) {
                            Text("Start Playing")
                        }
                        .frame(width: 200, height: 50)
                        .background(.blue)
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}
