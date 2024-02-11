//
//  ContentView.swift
//  Challenge #5
//
//  Created by Tony Alhwayek on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = true
    @State private var users = [User]()
    @State private var loadingError: Error?
    
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    
                    Text(user.address)
                }
                
            }
            .navigationTitle("Friends")
            .task {
                await loadData()
            }
        }
           
       }
    
    func loadData() async {
        isLoading = true
        loadingError = nil
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([User].self, from: data)
            users = decodedResponse
        } catch {
            loadingError = error
            print("Error during data loading:", error)
        }
        isLoading = false
    }
}


#Preview {
    ContentView()
}
