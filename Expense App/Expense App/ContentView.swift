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
    
    @Query(sort: \ExpenseItem.name) var expenses: [ExpenseItem]
    @State private var showingAddExpense = false
    
    @State private var businessTotal = 0.0
    @State private var personalTotal = 0.0
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(expense.name)
                                .font(.headline)
                            
                            Text(expense.type)
                        }
                        
                        Spacer()
                        
                        Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .expenseStyle(for: expense)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            removeExpense(expense)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink(destination: AddView()) {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeExpense(_ expense: ExpenseItem) {
        modelContext.delete(expense)
    }
}

#Preview {
    ContentView()
}
