//
//  Habit.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var timesCompleted: Int = 0
}
