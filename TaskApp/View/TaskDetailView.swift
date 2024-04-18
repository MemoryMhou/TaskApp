//
//  TaskDetailView.swift
//  TaskApp
//
//  Created by Memory Mhou on 18/04/2024.
//

import SwiftUI

struct TaskDetailView: View {
    var task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(task.title)
                .font(.title)
                .padding(.bottom, 5)
                .foregroundColor(task.isComplete ? .gray : .primary)
            if let description = task.description {
                Text(description)
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            if let dueDate = task.dueDate {
                Text("Due Date: \(dueDate, formatter: dateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            HStack {
                Spacer()
                Button(action: {
                    TaskManager.shared.updateTask(at: TaskManager.shared.tasks.firstIndex(of: task)!, with: Task(id: task.id, title: task.title, description: task.description, dueDate: task.dueDate, isComplete: !task.isComplete))
                }) {
                    Text(task.isComplete ? "Mark as Incomplete" : "Mark as Complete")
                        .padding()
                        .foregroundColor(.white)
                        .background(task.isComplete ? Color.blue : Color.green)
                        .cornerRadius(8)
                }
                Spacer()
            }
        }
        .padding()
        .navigationTitle("Task Details")
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}
