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
    
    @State private var checkAmount = "$0.00"
    @State private var numberOfPeople = 0 // 0th index in the foreach loop, so defaults to 2 people
    @State private var tipPercentage = 18
    let tipPercentages = [5, 10, 15, 18, 20, 25, 0]
    
    // Calculate the final value
    var totalPerPerson: Double {
        let peopleCountDbl = Double(numberOfPeople) + 2
        let tipPercentageDbl = Double(tipPercentage) / 100 + 1
        let checkAmountDbl = Double(checkAmount.replacingOccurrences(of: "$", with: "")) ?? 0.00
        return (checkAmountDbl * tipPercentageDbl / peopleCountDbl)
    }
    
    var totalPlusTip: Double {
        let tipPercentageDbl = Double(tipPercentage) / 100 + 1
        let checkAmountDbl = Double(checkAmount.replacingOccurrences(of: "$", with: "")) ?? 0.00
        return (checkAmountDbl * tipPercentageDbl)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Amount: ")
                        // I used a string to do my own thing
                        // That rhymes!
                        TextField("Amount", text: $checkAmount)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                            .multilineTextAlignment(.trailing)
                            .onTapGesture {
                                checkAmount = "$"
                            }
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
                    // Proj #3 - Challenge #1
                    .foregroundStyle(tipPercentage == 0 ? .red : .black)
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
                        
                        // Format the string to two decimals
                        checkAmount = checkAmount.replacingOccurrences(of: "$", with: "")
                        if let checkDbl = Double(checkAmount) {
                            checkAmount = String(format: "%.2f", checkDbl)
                            checkAmount = "$" + checkAmount
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
