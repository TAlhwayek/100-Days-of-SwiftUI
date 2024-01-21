//
//  Challenge__4App.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UserDefaults.standard.register(defaults: ["ShowQuotes": true])
        return true
    }
}

@main
struct Challenge__4App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            Tabs()
        }
    }
}


