//
//  TaskListView.swift
//  TaskApp
//
//  Created by Memory Mhou on 18/04/2024.
//
import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskManager = TaskManager.shared
    @State private var isAddTaskPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(taskManager.tasks) { task in
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(task.title)
                                .font(.headline)
                                .foregroundColor(task.isComplete ? .gray : .primary)
                            if let description = task.description {
                                Text(description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            if let dueDate = task.dueDate {
                                Text("Due Date: \(dueDate, formatter: dateFormatter)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Tasks")
            .navigationBarItems(trailing:
                Button(action: {
                    isAddTaskPresented.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                }
            )
        }
        .sheet(isPresented: $isAddTaskPresented) {
            AddTaskView(isPresented: $isAddTaskPresented)
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            taskManager.deleteTask(at: index)
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}
