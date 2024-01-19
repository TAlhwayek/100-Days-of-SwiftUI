//
//  ContentView.swift
//  Navigation
//
//  Created by Tony Alhwayek on 1/18/24.
//

import SwiftUI




struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("HI")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("<") {
                            // TEXT
                        }
                        Button("|") {
                            // TEXT
                        }
                    }
                        
                        ToolbarItem(placement: .topBarLeading) {
                            Button(">") {
                                // TEXT
                            }
                        }
                }
        }
    }
}

#Preview {
    ContentView()
}
