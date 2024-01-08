//
//  ContentView.swift
//  test
//
//  Created by Tony Alhwayek on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    var matty = 5
    var body: some View {
        VStack {
           Text("\(matty)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
