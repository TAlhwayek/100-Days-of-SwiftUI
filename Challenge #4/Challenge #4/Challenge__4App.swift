//
//  Challenge__4App.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

// Registering user defaults for the showQuotes toggle to default to on
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UserDefaults.standard.register(defaults: ["ShowQuotes": true])
        return true
    }
}

@main
struct Challenge__4App: App {
    // This is also needed for registering
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // Handling themes
    @AppStorage("selectedTheme") var selectedTheme: String? // Default to system theme
    
    var body: some Scene {
        WindowGroup {
            Tabs()
                .preferredColorScheme(getColorScheme())
        }
    }
    
    func getColorScheme() -> ColorScheme? {
        switch selectedTheme {
        case "light":
            return .light
        case "dark":
            return .dark
        default:
            return nil // SYSTEM THEME
        }
    }
}


