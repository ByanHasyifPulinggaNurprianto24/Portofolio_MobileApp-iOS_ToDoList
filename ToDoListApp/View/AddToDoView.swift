//
//  AddToDoView.swift
//  ToDoListApp
//
//  Created by Byan Hasyif on 03/01/25.
//

import SwiftUI

struct AddToDoView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    @State private var selectedDeadline: Date = Date()
    var onSave: (String, String, Date?) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Enter task title", text: $taskTitle)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    TextField("Enter task description", text: $taskDescription)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }

                Section(header: Text("Deadline")) {
                    DatePicker("Select a deadline", selection: $selectedDeadline, displayedComponents: [.date])
                }
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !taskTitle.isEmpty {
                            onSave(taskTitle, taskDescription, selectedDeadline)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .disabled(taskTitle.isEmpty)
                }
            }
        }
    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView { _, _, _ in }
    }
}
