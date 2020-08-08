//
//  ContentView.swift
//  challenge
//
//  Created by Choi SeungHyuk on 2020/07/31.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let states = ["Rock", "Paper", "Scissors"]
    @State var isWin = false
    @State var stateIndex = 0
    
    private func reset() {
        isWin = Bool.random()
        stateIndex = Int.random(in: 0..<states.count)
    }
    
    var body: some View {
        VStack{
            Text("\(isWin ? "win" : "lose")")
            Text("computer : \(states[stateIndex])")
            Button("reset") {
                self.reset()
            }
        }
        
//        Text($stateIndex)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
