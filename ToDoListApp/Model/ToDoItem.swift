//
//  ToDoItem.swift
//  ToDoListApp
//
//  Created by Byan Hasyif on 03/01/25.
//

import Foundation

struct ToDoItem: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var deadline: Date?
    var isCompleted: Bool
}
