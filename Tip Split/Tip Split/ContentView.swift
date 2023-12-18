//
//  ContentView.swift
//  Tip Split
//
//  Created by Tony Alhwayek on 12/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0 // 0th index in the foreach loop, so defaults to 2 people
    @State private var tipPercentage = 20
    let tipPercentages = [5, 10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCountDbl = Double(numberOfPeople) + 2
        let tipPercentageDbl = Double(tipPercentage) / 100 + 1
        return (checkAmount * tipPercentageDbl / peopleCountDbl)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // Use the user's local currency
                    // Default to USD just in case
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<21) {
                            Text("\($0) people")
                        }
                    }
                }
                // I didn't like this
                // .pickerStyle(.navigationLink)
                
                Section("How much do you want to tip?") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("Tip Split")
        }
    }
}

#Preview {
    ContentView()
}
