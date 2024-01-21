//
//  ToDos.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/20/24.
//

import Foundation

@Observable
class ToDos {
    var toDosArray = [ToDo]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(toDosArray) {
                UserDefaults.standard.set(encoded, forKey: "ToDos")
            }
        }
    }
    
    init() {
        if let savedToDos = UserDefaults.standard.data(forKey: "ToDos") {
            if let decodedItems = try? JSONDecoder().decode([ToDo].self, from: savedToDos) {
                toDosArray = decodedItems
                return
            }
        }
        
        toDosArray = []
    }
}
