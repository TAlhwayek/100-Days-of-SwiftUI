//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Tony Alhwayek on 2/6/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    // Only show names that contain a capital R
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("R")
    }, sort: \User.name) var users: [User]
        
    
    var body: some View {
        NavigationStack{
            List(users) { user in
                    Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    
                    
                    let first = User(name: "Red Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Hanks", city: "Frankfurt", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Tandy Englerish", city: "Johnny English", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Frankz Kafka", city: "Moscow", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
