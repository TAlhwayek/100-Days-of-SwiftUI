//
//  ContentView.swift
//  Bookworm
//
//  Created by Tony Alhwayek on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
