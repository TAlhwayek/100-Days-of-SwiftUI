//
//  GameView.swift
//  Challenge #3
//
//  Created by Tony Alhwayek on 1/10/24.
//

import SwiftUI

struct GameView: View {
    @State private var nameOfUser: String
    @State private var maxNumbers: Int
    @State private var numberOfRounds: Int
    
    init(nameOfUser: String, maxNumbers: Int, numberOfQuestions: Int) {
        self.nameOfUser = nameOfUser
        self.maxNumbers = maxNumbers
        self.numberOfRounds = numberOfQuestions
    }
    
    var body: some View {
        Text("Hello, \(nameOfUser)")
    }
}

#Preview {
    GameView(nameOfUser: "Nameless Player", maxNumbers: 20, numberOfQuestions: 10)
}
