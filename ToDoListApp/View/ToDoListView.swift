//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Byan Hasyif on 03/01/25.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject private var viewModel = ToDoViewModel()
    @State private var isShowingAddTaskView = false

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.items.isEmpty {
                    Text("No tasks yet. Add a task to get started!")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.items) { item in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(item.title)
                                        .strikethrough(item.isCompleted, color: .gray)
                                        .foregroundColor(item.isCompleted ? .gray : .primary)
                                    Spacer()
                                    if item.isCompleted {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                    }
                                }
                                if !item.description.isEmpty {
                                    Text(item.description)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                if let deadline = item.deadline {
                                    Text("Deadline: \(deadline, formatter: dateFormatter)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .onTapGesture {
                                viewModel.toggleCompletion(of: item)
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                    }
                }
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingAddTaskView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddTaskView) {
                AddToDoView { newTaskTitle, newTaskDescription, deadline in
                    viewModel.addItem(title: newTaskTitle, description: newTaskDescription, deadline: deadline)
                }
            }
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
