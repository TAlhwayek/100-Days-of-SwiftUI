//
//  ContentView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

// TODO:
// Save settings and load (UserDefaults)
// Set up times completed
// Check challenge webpage
// Check theme? Maybe allow user to force dark/light mode or use system
//              Maybe extra themes?
//
// DetailView when clicked
// Maybe tab bar that switches between habits and to-do list?
//              That means I have to remove priority from habits
//              And maybe some other fixes


struct HabitList: View {
    @State private var habits = Habits()
    @State private var showSettingsSheet = false
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
                // New habit button
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddHabitView(habits: habits)) {
                        Image(systemName: "plus")
                    }
                }
                // Settings button
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showSettingsSheet.toggle()
                    }) {
                        Image(systemName: "gearshape")
                    }
                    .sheet(isPresented: $showSettingsSheet) {
                        SettingsView()
                    }
                }
            }
           
        }
        
    }
    
    func removeItems(at offset: IndexSet) {
        habits.habitsArray.remove(atOffsets: offset)
    }
}

#Preview {
    HabitList()
}
