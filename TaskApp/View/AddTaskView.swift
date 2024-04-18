//
//  AddTaskView.swift
//  TaskApp
//
//  Created by Memory Mhou on 18/04/2024.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var isPresented: Bool
    @State private var taskTitle = ""
    @State private var taskDescription = ""
    @State private var dueDate = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Task Title", text: $taskTitle)
                    TextField("Task Description", text: $taskDescription)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                }
                Section {
                    Button("Save Task") {
                        if let index = TaskManager.shared.tasks.firstIndex(where: { $0.title == taskTitle }) {
                            TaskManager.shared.updateTask(at: index, with: Task(id: TaskManager.shared.tasks[index].id, title: taskTitle, description: taskDescription, dueDate: dueDate, isComplete: TaskManager.shared.tasks[index].isComplete))
                        } else {
                            TaskManager.shared.addTask(Task(title: taskTitle, description: taskDescription, dueDate: dueDate))
                        }
                        isPresented.toggle()
                    }
                    .disabled(taskTitle.isEmpty)
                }
            }
            .navigationTitle("Add Task")
            .navigationBarItems(leading:
                Button("Cancel") {
                    isPresented.toggle()
                }
            )
        }
    }
}
