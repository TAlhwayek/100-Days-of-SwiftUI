//
//  PriorityStyle.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

struct PriorityStyle: ViewModifier {
    let habit: Habit
    
    func body(content: Content) -> some View {
        switch habit.priority {
        case "Low":
            content
                .foregroundStyle(.green)
        case "Medium":
            content
                .foregroundStyle(.orange)
        default:
            content
                .bold()
                .foregroundStyle(.red)
        }
    }
}

extension View {
    func priorityStyle(for habit: Habit) -> some View {
        modifier(PriorityStyle(habit: habit))
    }
}
