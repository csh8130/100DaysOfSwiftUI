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
    @State var score = 0
    
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
            HStack{
                ForEach(0 ..< states.count) { i in
                    Button(self.states[i]) {
                        if self.isWin {
                            if (i + 1) % 3 == self.stateIndex {
                                self.score += 1
                            } else {
                                self.score -= 1
                            }
                        } else {
                            if (i + 1) % 3 != self.stateIndex {
                                self.score += 1
                            } else {
                                self.score -= 1
                            }
                        }
                    }
                }
            }
            Text("score:\(score)")
        }
        
//        Text($stateIndex)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
