//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Tony Alhwayek on 1/31/24.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "Timmy"
}

struct ContentView: View {
    var body: some View {
        Button("Encode Timmy", action: encodeTimmy)
    }
    
    func encodeTimmy() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}
    
    #Preview {
        ContentView()
    }
