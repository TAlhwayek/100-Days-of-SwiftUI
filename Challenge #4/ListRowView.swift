//
//  ListRowView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/20/24.
//

import SwiftUI

struct ListRowView: View {
    @State private var isCompleted: Bool = false
    
    let toDo: ToDo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(toDo.title)
                    .font(.title2.bold())
                    .strikethrough(isCompleted)
            }
            
            HStack {
                Text(toDo.description)
                    .font(.caption)
                    .strikethrough(isCompleted)
                
                Spacer()
                
                Text(toDo.priority)
                    .font(.caption)
                    .priorityStyle(for: toDo)
                    .strikethrough(isCompleted)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                isCompleted.toggle()
            }
        }
    }
}

#Preview {
    ListRowView(toDo: ToDo(title: "TEST", description: "TEST DESC", priority: "Low"))
}
