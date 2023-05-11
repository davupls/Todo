//
//  ContentView.swift
//  Todo
//
//  Created by David Mclean on 5/11/23.
//

import SwiftUI

struct TodoMainView: View {
    @State private var taskNote = String()
    @State private var taskList = [String]()
    
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
                TextField("What needs to get done today?", text: $taskNote)
                    .autocorrectionDisabled(true)
                    .onSubmit {
                        if !taskNote.isEmpty {
                            taskList.append(taskNote)
                        }
                        taskNote = ""
                    }
                    .padding(.bottom)
                
                
                
                    VStack {
                            List(taskList, id: \.self) { task in
                                TaskView(task: task)
                            }
                            .listStyle(.plain)
                    }
                
                    Button("Clear List") {
                        taskList.removeAll()
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
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoMainView()
    }
}



