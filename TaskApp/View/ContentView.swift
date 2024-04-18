//
//  ContentView.swift
//  TaskApp
//
//  Created by Memory Mhou on 18/04/2024.
//
import SwiftUI

@main
struct TaskApp: App {
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
