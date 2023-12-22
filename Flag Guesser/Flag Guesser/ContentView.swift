//
//  ContentView.swift
//  Flag Guesser
//
//  Created by Tony Alhwayek on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        LinearGradient(stops: [
//            .init(color:.mint, location: 0),
//            .init(color:.blue, location: 0.8)
//        ], startPoint: .top, endPoint: .bottom)
//        .ignoresSafeArea()
//        RadialGradient(colors: [.blue, .mint], center: .center, startRadius: 0, endRadius: 250)
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.blue.gradient)
    }
}

#Preview {
    ContentView()
}
