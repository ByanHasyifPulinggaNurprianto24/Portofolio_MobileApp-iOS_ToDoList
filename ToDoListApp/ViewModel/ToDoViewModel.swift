//
//  ToDoViewModel.swift
//  ToDoListApp
//
//  Created by Byan Hasyif on 03/01/25.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var items: [ToDoItem] = []
    
    func addItem(title: String, description: String, deadline: Date?) {
        let newItem = ToDoItem(title: title, description: description, deadline: deadline, isCompleted: false)
        items.append(newItem)
    }
    
    func toggleCompletion(of item: ToDoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
