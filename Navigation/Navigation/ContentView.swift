//
//  ContentView.swift
//  Navigation
//
//  Created by Tony Alhwayek on 1/18/24.
//

import SwiftUI




struct ContentView: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("HELLO")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
            
            
        }
    }
}

#Preview {
    ContentView()
}
