//
//  ContentView.swift
//  Challenge
//
//  Created by Choi SeungHyuk on 2020/07/08.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    @State private var userInputType = 0
    let inputTypes = ["m", "km", "ft", "yd"]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("변환하고 싶은 길이 입력")) {
                    TextField("길이", text: $userInput)
                        .keyboardType(.decimalPad)
                    Picker("입력 단위", selection: $userInputType) {
                        ForEach(0 ..< inputTypes.count) {
                            Text("\(self.inputTypes[$0])")
                        }
                    }
                }
            }
            .navigationBarTitle("길이 변환")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
