//
//  ExpenseStyle.swift
//  Expense App
//
//  Created by Tony Alhwayek on 2/10/24.
//

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
