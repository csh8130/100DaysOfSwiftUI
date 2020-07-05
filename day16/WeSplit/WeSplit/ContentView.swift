//
//  ContentView.swift
//  WeSplit
//
//  Created by Choi SeungHyuk on 2020/07/05.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Your name is \(name)")
                    Button("Tap Count: \(tapCount)") {
                        self.tapCount += 1
                    }
                    TextField("Enter your name", text: $name)
                }
                
                Section {
                    VStack {
                        Picker("Select your student", selection: $selectedStudent) {
                            ForEach(0 ..< students.count) {
                                Text(self.students[$0])
                            }
                        }
                        Text("You chose: Student # \(students[selectedStudent])")
                    }
                }
                
                ForEach(0 ..< 100) {
                    Text("Row \($0)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
