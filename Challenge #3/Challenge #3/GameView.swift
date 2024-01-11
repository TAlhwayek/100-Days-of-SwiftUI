//
//  GameView.swift
//  Challenge #3
//
//  Created by Tony Alhwayek on 1/10/24.
//

import SwiftUI

struct GameView: View {
    @State private var nameOfUser = ""
    
    var body: some View {
        Text("Hello, \(nameOfUser)")
    }
}

#Preview {
    GameView()
}
