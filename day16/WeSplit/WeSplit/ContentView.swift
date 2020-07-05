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
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello World")
                    Button("Tap Count: \(tapCount)") {
                        self.tapCount += 1
                    }
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
