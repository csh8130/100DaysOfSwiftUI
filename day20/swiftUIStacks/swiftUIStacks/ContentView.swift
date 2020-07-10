//
//  ContentView.swift
//  swiftUIStacks
//
//  Created by Choi SeungHyuk on 2020/07/10.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Hello, World!")
            Text("This is another text view")
            HStack(spacing: 20) {
                Text("Hello World")
                Text("This is inside a stack")
            }
            ZStack {
                Text("1235678")
                Text("54326")
            }
            VStack {
                Text("First")
                Text("Second")
                Text("Third")
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
