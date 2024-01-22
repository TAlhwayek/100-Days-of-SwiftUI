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
    @AppStorage("selectedTheme") var selectedTheme: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("Show motivational quotes under habits", isOn: $showQuotes)
                    .padding()
                    .onChange(of: showQuotes) {
                        UserDefaults.standard.set(showQuotes, forKey: "ShowQuotes")
                    }
                
                HStack {
                    Text("Select Theme")
                    
                    Spacer()
                    
                    Picker("Select Theme", selection: $selectedTheme) {
                        Text("Light").tag("light")
                        Text("Dark").tag("dark")
                        Text("System").tag("system")
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                Spacer()
                
                Button {
                    // Handle sign in logic
                } label: {
                    Text("Sign in")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .cornerRadius(50)
                        .foregroundStyle(Color(uiColor: .label))
                }
                .padding(.horizontal, 75)
                .padding(.vertical, 10)
                Button {
                    // Handle sign up logic
                } label: {
                    Text("Sign up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(Color(uiColor: .label))
                        .overlay {
                            RoundedRectangle(cornerRadius: 50)
                                .stroke((.blue), lineWidth: 1)
                        }
                }
                .padding(.horizontal, 75)
                
                Spacer()
            }
            
        }
        // Temp fix for sheet not dynamically updating when theme is changed
        .onChange(of: selectedTheme) {
            dismiss()
        }
    }
}

#Preview {
    SettingsView()
}
