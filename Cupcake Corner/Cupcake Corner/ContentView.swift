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

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("Error loading image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}
    
    #Preview {
        ContentView()
    }
