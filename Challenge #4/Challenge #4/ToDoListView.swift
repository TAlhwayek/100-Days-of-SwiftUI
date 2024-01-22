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
                        ListRowView(toDo: toDo)
                    }
                    .onDelete(perform: removeItems)
                }
                .listStyle(.plain)
                .navigationTitle("Habit Tracker")
                .navigationBarTitleDisplayMode(.inline)
            }
            .toolbar {
                // New To-do item button
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
//                            .presentationDetents([.medium, .large])
//                            .presentationDragIndicator(.visible)
                    }
                }
            }
            .navigationTitle("To-do List")
        }
    }
    
    func removeItems(at offset: IndexSet) {
        toDos.toDosArray.remove(atOffsets: offset)
    }
}

#Preview {
    ToDoListView()
}
