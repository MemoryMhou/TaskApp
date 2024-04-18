//
//  Task.swift
//  TaskApp
//
//  Created by Memory Mhou on 18/04/2024.
//

import Foundation

struct Task: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String?
    var dueDate: Date?
    var isComplete: Bool = false

    mutating func toggleCompletion() {
        isComplete.toggle()
    }
}
