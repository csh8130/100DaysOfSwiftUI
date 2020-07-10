//
//  ContentView.swift
//  swiftUIColorNFrame
//
//  Created by Choi SeungHyuk on 2020/07/11.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
//            Color.gray.edgesIgnoringSafeArea(.all) 세이프에리어 벗어나서 전부 가득 채우고싶을 때
            Color.red.frame(width: 10,height: 40)
            Text("Your content")
            .background(Color.blue)
            Text("Your content Your content")
        }
        .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
