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
                                    .priorityStyle(for: habit)
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
