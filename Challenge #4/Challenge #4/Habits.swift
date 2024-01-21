//
//  Habits.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import Foundation

@Observable
class Habits {
    var habitsArray = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habitsArray) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                habitsArray = decodedItems
                return
            }
        }
        
        habitsArray = []
    }
}
