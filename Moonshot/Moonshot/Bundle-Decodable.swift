//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Tony Alhwayek on 1/15/24.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        // Find file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // Load file into data instance
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        // Decode data
        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
    
        return loaded
    }
}
