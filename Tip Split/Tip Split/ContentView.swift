//
//  ContentView.swift
//  Tip Split
//
//  Created by Tony Alhwayek on 12/16/23.
//

import SwiftUI

struct ContentView: View {
    // State is needed to allow variables to be mutated
    // Private indicates that this variables will be made and used only in this view
    @State private var tapCount = 0
    
    @State private var name = ""
    
    let students = ["Johnny", "Timmy", "Freddy"]
    @State private var selectedStudent = "Johnny"
    
    var body: some View {
        //        NavigationStack {
        //            Form {
        //                Section {
        //                    Text("Hello world")
        //                }
        //
        //                Section {
        //                    Text("Hello John")
        //                }
        //            }
        //            .navigationTitle("SwiftUI")
        //            .navigationBarTitleDisplayMode(.inline)
        //        }
        

        
//        Form {
//            Button("Tap Count: \(tapCount)") {
//                tapCount += 1
//            }
//            
//            // $ makes it a two-way binding
//            // Tells SwiftUI to read and write (to) the value
//            // I.e., "The value is read but also written back"
//            TextField("Enter your name", text: $name)
//            Text("Hello \(name)")
//            
//            Section {
//                ForEach(0..<20) { number in
//                    Text("Row: \(number)")
//                }
//                
//                // Could also write
//                // ForEach(0..<20 {
//                // Text("Row: \($0)")
//                // }
//            }
//        }
        
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    // Self tells SwiftUI that each string is its own unique identifier
                    ForEach(students, id: \.self) {
                        // $0 selects item
                        Text($0)
                    }
                }
            }
            .navigationTitle("Pick a student")
        }
        
    }
}

#Preview {
    ContentView()
}
