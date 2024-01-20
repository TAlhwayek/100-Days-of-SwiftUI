//
//  AddToDoView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/20/24.
//

import SwiftUI

struct AddToDoView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var description = ""
    @State private var priority = "Low"
    
    let priorities = ["Low", "Medium", "High"]
    
    var toDos: ToDos
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                Picker("Priority", selection: $priority) {
                    ForEach(priorities, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Add a New To-do")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        let newToDo = ToDo(title: title, description: description, priority: priority)
                        toDos.toDosArray.append(newToDo)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    AddToDoView(toDos: ToDos())
}
