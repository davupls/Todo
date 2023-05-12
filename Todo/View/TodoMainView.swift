//
//  ContentView.swift
//  Todo
//
//  Created by David Mclean on 5/11/23.
//

import SwiftUI
import CoreData

struct TodoMainView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tasks: FetchedResults<Tasks>
    
    @State private var userNoteInput = String()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Text("\(Date.now.addingTimeInterval(600), style: .date)")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                    Image(systemName: "calendar")
                        .foregroundColor(.purple)
                }
                TextField("What needs to get done today?", text: $userNoteInput)
                    .autocorrectionDisabled(true)
                    .onSubmit {
                        if !userNoteInput.isEmpty {
                            let task = Tasks(context: moc)
                            task.id = UUID()
                            task.taskNote = userNoteInput
                            try? moc.save()
                        }
                        userNoteInput = ""
                    }
                    .padding(.bottom)
                    .textFieldStyle(.roundedBorder)
                
                
                
                    VStack {
                            List(tasks) { task in
                                TaskView(task: task.taskNote ?? "Unknown")
                            }
                            .listStyle(.plain)
                    }
                
                    Button("Clear List") {
                        func printAll(at offsets: IndexSet) {
                            for offset in offsets {
                                let task = tasks[offset]
                                print(task)
                                moc.delete(task)
                            }
                        }
                    
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.purple)
                    .cornerRadius(8)
                    
            }
            .navigationTitle("Todo")
            .padding([.horizontal, .bottom])
        }
    }
    
    func deleteAll() {
        
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoMainView()
    }
}



