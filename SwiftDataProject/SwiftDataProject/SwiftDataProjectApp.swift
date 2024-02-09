//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Tony Alhwayek on 2/6/24.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
