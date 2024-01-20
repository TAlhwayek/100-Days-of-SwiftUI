//
//  ToDoListView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/20/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var showSettingsSheet = false
    
    var body: some View {
        NavigationStack {
            
//            .toolbar {
//                // New habit button
//                ToolbarItem(placement: .topBarTrailing) {
//                    NavigationLink(destination: AddHabitView(habits: habits)) {
//                        Image(systemName: "plus")
//                    }
//                }
//                // Settings button
//                ToolbarItem(placement: .topBarLeading) {
//                    Button(action: {
//                        showSettingsSheet.toggle()
//                    }) {
//                        Image(systemName: "gearshape")
//                    }
//                    .sheet(isPresented: $showSettingsSheet) {
//                        SettingsView()
//                            .presentationDetents([.medium, .large])
//                            .presentationDragIndicator(.automatic)
//                    }
//                }
//            }
        }
        
    }
}

#Preview {
    ToDoListView()
}
