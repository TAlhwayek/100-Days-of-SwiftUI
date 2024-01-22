//
//  ContentView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

// TODO:
// Save settings and load (UserDefaults) - DONE
// Set up times completed
//              Maybe add done button on detailview
//              Also allow edits in detailview?
//              Make it rain confetti once done
// Check challenge webpage
// Check theme? Maybe allow user to force dark/light mode or use system
//              Maybe extra themes?
// DetailView when clicked
// Maybe tab bar that switches between habits and to-do list? - DONE
//              That means I have to remove priority from habits - DONE
//              And maybe some other fixes
// Maybe sort todolist by priority
// Maybe either strikethrough to-dos, or put them in another section that shows completed today
//              Then reset daily


struct HabitListView: View {
    @State private var habits = Habits()
    @State private var showSettingsSheet = false
    @AppStorage("ShowQuotes") private var showQuotes: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(habits.habitsArray) { habit in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(habit.title)
                                    .font(.title2.bold())
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
                
                if showQuotes {
                    Text(motivationalQuotes[19])
                        .frame(height: 80, alignment: .center)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .padding(.horizontal)
                        .bold()
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
                    //                        NavigationLink(destination: SettingsView()) {
                    //                            Image(systemName: "gearshape")
                    //                        }
                    Button(action: {
                        showSettingsSheet.toggle()
                    }) {
                        Image(systemName: "gearshape")
                    }
                    .sheet(isPresented: $showSettingsSheet) {
                        SettingsView()
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
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
    HabitListView()
}
