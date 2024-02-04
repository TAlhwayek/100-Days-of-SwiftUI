//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Tony Alhwayek on 2/2/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        .modelContainer(for: Student.self)
    }
}
