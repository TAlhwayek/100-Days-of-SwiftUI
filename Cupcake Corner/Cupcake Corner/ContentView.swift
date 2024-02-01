//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Tony Alhwayek on 1/31/24.
//

import SwiftUI

enum HttpErrors: Error {
    case badURL, badResponse, invalidData
}

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
                
            }
        }
        .task {
            do {
                try await loadData()
            } catch {
                print("ERROR")
            }
        }
    }
    
    func loadData() async throws {
        guard let url = URL(string: "https://itunes.apple.com/search?term=dream+theater&entity=song") else {
            throw HttpErrors.badURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            throw HttpErrors.invalidData
        }
    }
}

#Preview {
    ContentView()
}
