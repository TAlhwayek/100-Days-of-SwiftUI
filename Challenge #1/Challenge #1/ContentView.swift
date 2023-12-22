//
//  ContentView.swift
//  Challenge #1
//
//  Created by Tony Alhwayek on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enteredValue: Double = 0.0
    @State private var selectedUnit = "Celsius"
    @State private var toConvertUnit = "Fahrenheit"
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    func conversionResult(toConvert: String) -> String {
        
        switch selectedUnit {
            
            // If converting from C
        case "Celsius":
            switch toConvert {
            case "Fahrenheit":
                return String(format: "%.2f", enteredValue * 1.8 + 32)
            case "Kelvin":
                return String(format: "%.2f", enteredValue + 273.15)
            default:
                // Default to C to F
                return String(format: "%.2f", enteredValue * 1.8 + 32)
            }
            
            // If Converting from F
        case "Fahrenheit":
            switch toConvert {
            case "Celsius":
                return String(format: "%.2f", (enteredValue - 32) * (5/9))
            case "Kelvin":
                return String(format: "%.2f", (enteredValue - 32) * (5/9) + 273.15)
                // Default to F to C
            default:
                return String(format: "%.2f", (enteredValue - 32) * (5/9))
            }
            
        case "Kelvin":
            switch toConvert {
            case "Celsius":
                return String(format: "%.2f", enteredValue - 273.15)
            case "Fahrenheit":
                return String(format: "%.2f", ((enteredValue - 273.15) * 1.8 + 32))
                // Default K to C
            default:
                return String(format: "%.2f", enteredValue - 273.15)
            }
        default:
            return "Error"
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert from") {
                    HStack {
                        Text("Enter value: ")
                        TextField("0.00", value: $enteredValue, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                    }
                    HStack {
                        Text("Unit: ")
                        Picker("Select unit", selection: $selectedUnit){
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: selectedUnit) {
                            // This works with the bottom 'let' to dynamically update based on the selectedUnit
                            let convertUnits = units.filter { $0 != selectedUnit }
                            toConvertUnit = convertUnits[0]
                        }
                    }
                }
                
                Section("Convert to") {
                    // Dynamically modify the picker
                    HStack {
                        Text("Unit: ")
                        Picker("Select unit", selection: $toConvertUnit) {
                            // This allows the picker to dynamically update based on the selectedUnit
                            let convertUnits = units.filter { $0 != selectedUnit }
                            ForEach(convertUnits, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    HStack {
                        Text("Result:")
                        Spacer()
                        Text(conversionResult(toConvert:toConvertUnit))
                    }
                }
            }
            .navigationTitle("Temp Converter")
        }
    }
}

#Preview {
    ContentView()
}
