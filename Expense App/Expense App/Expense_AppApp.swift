//
//  Expense_AppApp.swift
//  Expense App
//
//  Created by Tony Alhwayek on 1/8/24.
//

import SwiftData
import SwiftUI

@main
struct Expense_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
