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
                    .onSubmit {
                        taskList.append(taskNote)
                        taskNote = ""
                    }
                
                Section {
                    VStack {
                        ForEach(taskList, id: \.self) { task in
                            TaskView(task: task)
                        }
                    }
                }
                
                
                Spacer()
            }
            .navigationTitle("Todo")
            .padding(.horizontal)
        }
        
        
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoMainView()
    }
}



