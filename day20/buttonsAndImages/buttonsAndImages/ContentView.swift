//
//  ContentView.swift
//  buttonsAndImages
//
//  Created by Choi SeungHyuk on 2020/07/11.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Tap me!") {
                print("Button was tapped")
            }
            Button(action: {
                print("Button2 was tapped")
            }) {
                Text("Tap me!2")
            }
            Button(action: {
                print("Edit button was tapped")
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "pencil").renderingMode(.original)
                    Text("Edit")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
