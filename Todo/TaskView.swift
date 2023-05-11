//
//  TaskView.swift
//  Todo
//
//  Created by David Mclean on 5/11/23.
//

import SwiftUI

struct TaskView: View {
    @State private var isOn = false
    var task : String
    
    var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                Text(task)
            }
            .toggleStyle(iOSCheckboxToggleStyle())
            .font(.title3)
            Spacer()
        }
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {

            configuration.isOn.toggle()

        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
        .foregroundColor(.black)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: "Meet up with Donald")
    }
}
