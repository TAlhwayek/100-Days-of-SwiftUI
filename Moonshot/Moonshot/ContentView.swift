//
//  ContentView.swift
//  Moonshot
//
//  Created by Tony Alhwayek on 1/11/24.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new custom text")
        self.text = text
    }
}

struct ContentView: View {
    @State private var monthPicker = 0
    
    let months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
    
    var body: some View {
        ScrollView (.horizontal){
            LazyHStack(spacing: 8) {
                ForEach(1..<366) { day in
                    Button {
                        print("TODAY")
                    } label: {
                        Text("\(months[monthPicker])\n \(day)")
                    }
                    .font(.system(size: 12))
                    .foregroundStyle(.black)
                    .frame(width: 65, height: 80)
                    .overlay (
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                    .onAppear {
                        checkMonth(day: day)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(2)
        }
    }
    
    func checkMonth(day: Int) {
        if day <= 31 {
            monthPicker = 0
        } else if day <= 59 {
            monthPicker = 1
        }
    }
}

#Preview {
    ContentView()
}
