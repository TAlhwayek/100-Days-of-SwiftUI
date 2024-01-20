//
//  PriorityStyle.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

struct PriorityStyle: ViewModifier {
    let toDo: ToDo
    
    func body(content: Content) -> some View {
        switch toDo.priority {
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
    func priorityStyle(for toDo: ToDo) -> some View {
        modifier(PriorityStyle(toDo: toDo))
    }
}
