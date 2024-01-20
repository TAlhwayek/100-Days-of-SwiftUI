//
//  SettingsView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showQuotes = true
    
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("Show motivational quotes", isOn: $showQuotes)
                    .padding()
                
                Spacer()
            }
            //            .toolbar {
            //                Button("Close", systemImage: "xmark") {
            //                    dismiss()
            //                }
            //            }
        }
        
    }
}

#Preview {
    SettingsView()
}
