//
//  ContentView.swift
//  BetterRest
//
//  Created by Tony Alhwayek on 1/3/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    
    // Default to a 7 AM wake time
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
//                    VStack(alignment: .leading, spacing: 0) {
//                        Text("When do you want to wake up?")
//                            .font(.headline)
                    Section("When do you want to wake up?") {
                        HStack {
                            Text("Time: ")
                            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    
                    
//                    VStack(alignment: .leading, spacing: 0){
                    Section("Desired amount of sleep") {
//                        Text("Desired amount of sleep")
//                            .font(.headline)
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                    
//                    VStack(alignment: .leading, spacing: 0) {
//                        Text("Coffee intake")
                    Section("Coffee intake") {
                        // Inflect pluralizes when needed
//                        Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                        
                        // Challenge #2
                        Picker("Coffee amount: ", selection: $coffeeAmount) {
                            ForEach(1..<21) { cups in
                                    Text("^[\(cups) cup](inflect: true)")
                            }
                        }
                    }
                    
                    Section("Recommended bedtime") {
                        Text(calculateBedtime())
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            // Get seconds
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64((hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: sleepTime)
            
//            alertTitle = "Your ideal bedtime is: "
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem calculating your bedtime"
            return error.localizedDescription
        }
    }
}

#Preview {
    ContentView()
}
