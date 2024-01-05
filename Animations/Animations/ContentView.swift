//
//  ContentView.swift
//  Animations
//
//  Created by Tony Alhwayek on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .animation(.default, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 20))
        .animation(.spring(duration: 1, bounce: 0.5), value: enabled)

    }
}

#Preview {
    ContentView()
}
