//
//  ExpenseView.swift
//  Expense App
//
//  Created by Tony Alhwayek on 2/10/24.
//

import SwiftData
import SwiftUI

struct ExpenseView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    var body: some View {
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
    
   init(sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(sort: sortOrder)
    }
    
    func removeExpense(_ expense: ExpenseItem) {
        modelContext.delete(expense)
    }
}

#Preview {
    ExpenseView(sortOrder: [SortDescriptor(\ExpenseItem.amount)])
}
