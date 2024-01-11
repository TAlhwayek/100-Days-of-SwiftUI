//
//  ContentView.swift
//  iExpense
//
//  Created by Tony Alhwayek on 1/6/24.
//

import Observation
import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

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

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}


struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    @State private var businessTotal = 0.0
    @State private var personalTotal = 0.0
    
    
    var body: some View {
        NavigationStack {
            List {
                Section("Business") {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            HStack {
                                VStack(alignment: .leading) {
                                    
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .expenseStyle(for: item)
                            }
                        }
                }
                    .onDelete(perform: removeItems)
                }
                
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .expenseStyle(for: item)
                            }
                            
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
        
    }
    
    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
