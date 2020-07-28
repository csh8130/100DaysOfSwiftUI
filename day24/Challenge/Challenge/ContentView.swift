//
//  ContentView.swift
//  Challenge
//
//  Created by Choi SeungHyuk on 2020/07/17.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, big blue title!")
        .bigBlueTitleStyle()
    }
}

struct BitBlueTitle: ViewModifier {
 func body(content: Content) -> some View {
 content
 .font(.largeTitle)
 .foregroundColor(.white)
 .padding()
 .background(Color.blue)
 .clipShape(RoundedRectangle(cornerRadius: 10))
 }
}

extension View {
 func bigBlueTitleStyle() -> some View {
 self.modifier(BitBlueTitle())
 }
}
