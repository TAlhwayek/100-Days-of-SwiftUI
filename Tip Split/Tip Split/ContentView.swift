//
//  ContentView.swift
//  Tip Split
//
//  Created by Tony Alhwayek on 12/16/23.
//

import SwiftUI

struct ContentView: View {
    
    // FocusState is used to hide the keyboard (in this case)
    @FocusState private var amountIsFocused: Bool
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0 // 0th index in the foreach loop, so defaults to 2 people
    @State private var tipPercentage = 20
    let tipPercentages = [5, 10, 15, 20, 25, 0]
    
    // Calculate the final value
    var totalPerPerson: Double {
        let peopleCountDbl = Double(numberOfPeople) + 2
        let tipPercentageDbl = Double(tipPercentage) / 100 + 1
        return (checkAmount * tipPercentageDbl / peopleCountDbl)
    }
    
    var totalPlusTip: Double {
        let tipPercentageDbl = Double(tipPercentage) / 100 + 1
        return (checkAmount * tipPercentageDbl)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Amount: ")
                        // Use the user's local currency
                        // Default to USD just in case
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                            .multilineTextAlignment(.trailing)
                    }
                        
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
                        // Challenge #3 but ugly
                        // ForEach(0..<101) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    // Challenge #3
                    // But ugly
                    .pickerStyle(.navigationLink)
                }
                
                // Challenge #2
                // Show pre-split total (total + tip)
                Section("Total") {
                    Text(totalPlusTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("Tip Split")
            .toolbar { // Used to show a done button only when keyboard is open
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
