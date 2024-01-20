//
//  ContentView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

struct ContentView: View {
    
    // Colors
    // should remove if keeping it simple
    //    let backgroundColor = Color(red: 3.0 / 255.0 , green: 6.0 / 255.0, blue: 55.0 / 255.0)
    //    let listRowColor = Color(red: 114.0 / 255.0 , green: 4.0 / 255.0, blue: 85.0 / 255.0)
    //    let listRowColor2 = Color(red: 110.0 / 255.0 , green: 157.0 / 255.0, blue: 17.0 / 255.0)
    
    let motivationalQuotes = [
        "Believe you can and you're halfway there.",
        "The only way to do great work is to love what you do.",
        "Don't watch the clock; do what it does. Keep going.",
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
        "Your time is limited, don't waste it living someone else's life.",
        "The only limit to our realization of tomorrow will be our doubts of today.",
        "It always seems impossible until it's done.",
        "Success is stumbling from failure to failure with no loss of enthusiasm.",
        "Your attitude, not your aptitude, will determine your altitude.",
        "The future belongs to those who believe in the beauty of their dreams.",
        "The only person you are destined to become is the person you decide to be.",
        "You are never too old to set another goal or to dream a new dream.",
        "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.",
        "The way to get started is to quit talking and begin doing.",
        "Strive not to be a success, but rather to be of value.",
        "Don't be pushed around by the fears in your mind. Be led by the dreams in your heart.",
        "Your life does not get better by chance, it gets better by change.",
        "The only limit to our realization of tomorrow will be our doubts of today.",
        "You miss 100% of the shots you don't take.",
        "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will."
    ]
    
    // Actual variables
    @State private var habits = Habits()
    
    var turnOnQuotes = true
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(habits.habitsArray) { habit in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(habit.title)
                                    .font(.title2.bold())
                                
                                Spacer()
                                
                                Text(habit.priority)
                                    .font(.caption)
                            }
                            
                            HStack {
                                Text(habit.description)
                                    .font(.caption)
                                
                                Spacer()
                                
                                Text("Times completed: \(habit.timesCompleted)")
                                    .font(.caption)
                            }
                        }
                        
                        
                    }
                    .onDelete(perform: removeItems)
                }
                .listStyle(.plain)
                .navigationTitle("Habit Tracker")
                .navigationBarTitleDisplayMode(.inline)
                
                if turnOnQuotes {
                    Text(motivationalQuotes[19])
                        .frame(height: 80, alignment: .center)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .padding(.horizontal)
                }
            }
            .toolbar {
                NavigationLink(destination: AddHabitView(habits: habits)) {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItems(at offset: IndexSet) {
        habits.habitsArray.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
