//
//  ContentView.swift
//  iExpense
//
//  Created by Tony Alhwayek on 1/6/24.
//

import SwiftData
import SwiftUI

struct ExpenseStyle: ViewModifier {
    let expenseItem: ExpenseItem
    
    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<10:
            content
                .foregroundStyle(.blue)
        case 10..<100:
            content
                .foregroundStyle(.green)
        default:
            content
                .font(.headline.bold())
                .foregroundStyle(.red)
        }
    }
}

extension View {
    func expenseStyle(for expenseItem: ExpenseItem) -> some View {
        modifier(ExpenseStyle(expenseItem: expenseItem))
    }
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    @State private var showingAddExpense = false
    @State private var businessTotal = 0.0
    @State private var personalTotal = 0.0
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseView(sortOrder: sortOrder)
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink(destination: AddView()) {
                    Image(systemName: "plus")
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

#Preview {
    ContentView()
}
