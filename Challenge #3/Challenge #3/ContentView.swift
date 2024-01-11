//
//  ContentView.swift
//  Challenge #3
//
//  Created by Tony Alhwayek on 1/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var maxNumbers = 2
    @State private var numberOfQuestions = 10
    @State private var nameOfUser = ""
    
    var questionCount = [5, 10, 15, 20]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.mint, .green], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    VStack {
                        Text("Enter your name")
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
                    
                    VStack {
                        Text("Max number: ")
                        
                        Stepper("\(maxNumbers)", value: $maxNumbers, in: 2...20)
                            .frame(width: 250, height: 40)
                    }
                    .frame(width: 300, height: 80)
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 5))
                    .border(Color.black, width: 2)
                    .cornerRadius(5)
                    
                    
                    VStack {
                        Text("Number of questions: ")
                        Picker("Questions", selection: $numberOfQuestions) {
                            ForEach(questionCount, id: \.self) { count in
                                Text("\(count)")
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
                    
                    Button("Start Playing") {
                        
                    }
                    .frame(width: 200, height: 50)
                    .background(.blue)
                    .foregroundStyle(.black)
                    .cornerRadius(5)
                    
                    Spacer()
                }
            }
            .navigationTitle("Multipliplaytion")
        }
    }
}

#Preview {
    ContentView()
}
