//
//  TabView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            HabitListView()
                .tabItem {
                    Label("Habits", systemImage: "clock.arrow.2.circlepath")
                }
            
            ToDoListView()
                .tabItem {
                    Label("To-Do List", systemImage: "list.number")
                }
        }
    }
}

#Preview {
    Tabs()
}
