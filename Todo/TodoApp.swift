//
//  TodoApp.swift
//  Todo
//
//  Created by David Mclean on 5/11/23.
//

import SwiftUI

@main
struct TodoApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            TodoMainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
