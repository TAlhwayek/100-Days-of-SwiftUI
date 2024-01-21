//
//  TabView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

struct Tabs: View {
    @State var selectedTab = 1
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                HabitListView()
                    .tabItem {
                        Label("Habits", systemImage: "clock.arrow.2.circlepath")
                    }.tag(1)
                
                // THIS IS JUST A PLACEHOLDER VIEW
                ToDoListView()
                    .tabItem {
                        Label("To-Do List", systemImage: "list.number")
                    }.tag(2)
            }
            .navigationTitle(selectedTab == 1 ? "Habit Tracker" : "To-do List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Tabs()
}
