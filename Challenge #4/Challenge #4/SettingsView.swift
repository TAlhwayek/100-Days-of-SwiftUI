//
//  SettingsView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showQuotes: Bool = UserDefaults.standard.bool(forKey: "ShowQuotes")
    
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("Show motivational quotes under habits", isOn: $showQuotes)
                    .padding()
                    .onChange(of: showQuotes) {
                        UserDefaults.standard.set(showQuotes, forKey: "ShowQuotes")
                    }
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
