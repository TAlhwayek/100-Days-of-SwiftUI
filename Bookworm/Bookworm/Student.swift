//
//  Student.swift
//  Bookworm
//
//  Created by Tony Alhwayek on 2/4/24.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
