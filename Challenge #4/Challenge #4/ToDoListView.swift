//
//  ToDoListView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/20/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var toDos = ToDos()
    @State private var showSettingsSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(toDos.toDosArray) { toDo in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(toDo.title)
                                    .font(.title2.bold())
                                
                                Spacer()
                                
                                Text(toDo.priority)
                                    .font(.caption)
                                    .priorityStyle(for: toDo)
                            }
                            
                            HStack {
                                Text(toDo.description)
                                    .font(.caption)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .listStyle(.plain)
                .navigationTitle("Habit Tracker")
                .navigationBarTitleDisplayMode(.inline)
            }
            .toolbar {
                // New habit button
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddToDoView(toDos: toDos)) {
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
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    }
                }
            }
            
        }
        
    }
    
    func removeItems(at offset: IndexSet) {
        toDos.toDosArray.remove(atOffsets: offset)
    }
}

#Preview {
    ToDoListView()
}
