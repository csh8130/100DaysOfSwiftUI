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
