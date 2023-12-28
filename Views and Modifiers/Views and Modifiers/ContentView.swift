//
//  ContentView.swift
//  Views and Modifiers
//
//  Created by Tony Alhwayek on 12/27/23.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct CapsuleTextMod: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}



struct Title : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.red)
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func waterMarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        CapsuleText(text: "CHEESE")
            .foregroundStyle(.red)
        CapsuleText(text: "I like it")
            .foregroundStyle(.indigo)
        Text("HELLO")
        // Before extension
        //  .modifier(Title())
        // After extension
            .titleStyle()
        
        Color.blue
            .frame(width: 300, height: 200)
            .waterMarked(with: "Tony Alhwayek")
        
        Text("HELLO 2.0")
            .modifier(CapsuleTextMod(text: "FISH"))

    }
}

#Preview {
    ContentView()
}
