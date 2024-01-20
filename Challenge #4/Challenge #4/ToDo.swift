//
//  ToDo.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/20/24.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var priority: String
}
