//
//  DataController.swift
//  Todo
//
//  Created by David Mclean on 5/12/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "TaskDataModel")
    
    init() {
        container.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
