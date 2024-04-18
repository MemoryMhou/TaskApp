//
//  TaskManager.swift
//  TaskApp
//
//  Created by Memory Mhou on 18/04/2024.
//

import Foundation

class TaskManager: ObservableObject {
    static let shared = TaskManager()
    
    @Published var tasks: [Task] {
        didSet {
            saveTasks()
        }
    }
    
    private init() {
        self.tasks = TaskManager.loadTasks()
    }
    
    private static func loadTasks() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: "tasks"),
              let tasks = try? JSONDecoder().decode([Task].self, from: data) else {
            return []
        }
        return tasks
    }
    
    private func saveTasks() {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: "tasks")
        }
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func deleteTask(at index: Int) {
        tasks.remove(at: index)
    }
    
    func updateTask(at index: Int, with task: Task) {
        tasks[index] = task
    }
}
