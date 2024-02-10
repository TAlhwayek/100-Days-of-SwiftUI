//
//  ContentView.swift
//  iExpense
//
//  Created by Tony Alhwayek on 1/6/24.
//

import SwiftData
import SwiftUI



struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    @State private var filterSelection = "All"
    @State private var showingAddExpense = false
    @State private var businessTotal = 0.0
    @State private var personalTotal = 0.0
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseView(type: filterSelection, sortOrder: sortOrder)
            }
            .navigationTitle("iExpense")
            .toolbar {
                // Right side
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink(destination: AddView()) {
                        Image(systemName: "plus")
                    }
                }

                // Left side
                ToolbarItemGroup(placement: .topBarLeading) {
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Filter", selection: $filterSelection) {
                            Text("All Expenses")
                                .tag("All")
                            Text("Personal Only")
                                .tag("Personal")
                            Text("Business Only")
                                .tag("Business")
                        }
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                            
                            Text("Sort by Amount")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
