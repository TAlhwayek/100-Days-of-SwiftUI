//
//  Expense.swift
//  Expense App
//
//  Created by Tony Alhwayek on 2/10/24.
//

import Foundation
import SwiftData

@Model
class ExpenseItem: Identifiable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}
