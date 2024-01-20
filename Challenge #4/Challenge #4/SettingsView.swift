//
//  SettingsView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showQuotes = true
    
    var body: some View {
        VStack {
            Toggle("Show motivational quotes", isOn: $showQuotes)
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    SettingsView()
}
